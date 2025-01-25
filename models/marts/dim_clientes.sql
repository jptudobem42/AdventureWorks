with
stg_pessoa as (
    select
        businessentityid
        , fullname
    from {{ ref('stg_person__person') }}
)

, stg_loja as (
    select
        businessentityid
        , name as storename
    from {{ ref('stg_sales__store') }}
)

, stg_cliente as (
    select
        customerid
        , personid
        , storeid
    from {{ ref('stg_sales__customer') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['stg_cliente.customerid']) }} as sk_cliente
    , stg_cliente.customerid
    , stg_pessoa.fullname
    , stg_loja.storename
from stg_cliente
left join stg_pessoa
    on stg_pessoa.businessentityid = stg_cliente.personid
left join stg_loja
    on stg_loja.businessentityid = stg_cliente.storeid