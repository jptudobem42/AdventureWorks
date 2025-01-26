with

stg_pessoa as (
    select
        businessentityid
        , fullname
        , persontype
    from {{ ref('stg_person__person') }}
)

,stg_loja as (
    select
        businessentityid
        , name as storename
    from {{ ref('stg_sales__store') }}
)

, stg_cliente as (
    select
        customerid,
        personid,
        storeid
    from {{ ref('stg_sales__customer') }}
)

, stg_pedidos as (
    select
        distinct customerid
    from {{ ref('stg_sales__salesorderheader') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['stg_cliente.customerid']) }} as sk_cliente
    , stg_cliente.customerid
    , stg_pessoa.persontype
    , stg_loja.storename
    , stg_pessoa.fullname
    , case
        when stg_pedidos.customerid is not null then true
        else false
    end as is_order
from stg_cliente
left join stg_pessoa
    on stg_cliente.personid = stg_pessoa.businessentityid 
left join stg_loja
    on stg_cliente.storeid = stg_loja.businessentityid 
left join stg_pedidos
    on stg_cliente.customerid = stg_pedidos.customerid
where
    stg_cliente.personid is not null or stg_cliente.storeid is not null
