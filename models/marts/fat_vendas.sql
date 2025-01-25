with 

stg_salesorderdetail as (
    select
        salesorderid
        , salesorderdetailid
        , productid
        , orderqty
        , unitprice
        , unitprice * orderqty as revenue
    from {{ ref('stg_sales__salesorderdetail') }}
)

, stg_salesorderheader as (
    select
        salesorderid
        , customerid
        , creditcardid
        , shiptoaddressid
        , status as order_status
        , orderdate
    from {{ ref('stg_sales__salesorderheader') }}
)

, dim_cartaocredito as (
    select 
        sk_cartaocredito
        , creditcardid
    from {{ref('dim_cartaocredito')}}
)

, dim_clientes as (
    select 
        sk_cliente
        , customerid
    from {{ref('dim_clientes')}}
)

, dim_endereco as (
    select 
        sk_endereco
        , addressid 
    from {{ref('dim_endereco')}}
)

, dim_produtos as (
    select 
        sk_produto
        , productid
    from {{ref('dim_produtos')}}
)

, dim_razoesvendas as (
    select 
        sk_razoesvenda
        , salesorderid
    from {{ref('dim_razoesvendas')}}
)

, fat_vendas as (
    select
        {{ dbt_utils.generate_surrogate_key(['stg_salesorderdetail.salesorderid', 'stg_salesorderdetail.salesorderdetailid']) }} as sk_vendas
        , dim_cartaocredito.sk_cartaocredito
        , dim_clientes.sk_cliente
        , dim_endereco.sk_endereco
        , dim_produtos.sk_produto
        , dim_razoesvendas.sk_razoesvenda
        , stg_salesorderheader.orderdate
        , stg_salesorderdetail.salesorderid
        , stg_salesorderdetail.salesorderdetailid
        , stg_salesorderdetail.unitprice
        , stg_salesorderdetail.orderqty
        , stg_salesorderdetail.revenue
    from stg_salesorderdetail
    inner join stg_salesorderheader 
        on stg_salesorderheader.salesorderid = stg_salesorderdetail.salesorderid
    left join dim_cartaocredito
        on dim_cartaocredito.creditcardid = stg_salesorderheader.creditcardid
    left join dim_clientes
        on dim_clientes.customerid = stg_salesorderheader.customerid
    left join dim_endereco
        on dim_endereco.addressid = stg_salesorderheader.shiptoaddressid
    left join dim_produtos
        on dim_produtos.productid = stg_salesorderdetail.productid
    left join dim_razoesvendas
        on dim_razoesvendas.salesorderid = stg_salesorderheader.salesorderid
)

select 
    *
from fat_vendas