with 

stg_salesorderdetail as (
    select
        salesorderid
        , salesorderdetailid
        , productid
        , orderqty
        , unitprice
        , unitpricediscount
        , unitprice * orderqty as revenue
        , unitprice * orderqty - (unitprice * orderqty * unitpricediscount) as revenue_discounted
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

, razoesvendas as (
    select
        salesorderid
        , {{ generate_reason_indicators('reason_name') }}
    from {{ ref('int_salesreasons_agg') }}
)

, fat_vendas as (
    select
        {{ dbt_utils.generate_surrogate_key(['stg_salesorderdetail.salesorderid', 'stg_salesorderdetail.salesorderdetailid']) }} as sk_vendas
        , dim_cartaocredito.sk_cartaocredito
        , dim_clientes.sk_cliente
        , dim_endereco.sk_endereco
        , dim_produtos.sk_produto
        , stg_salesorderheader.orderdate
        , stg_salesorderdetail.salesorderid
        , stg_salesorderdetail.salesorderdetailid
        , stg_salesorderdetail.unitprice
        , stg_salesorderdetail.unitpricediscount
        , stg_salesorderdetail.orderqty
        , stg_salesorderdetail.revenue
        , stg_salesorderdetail.revenue_discounted
        , razoesvendas.* exclude salesorderid
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
    left join razoesvendas
        on razoesvendas.salesorderid = stg_salesorderdetail.salesorderid
)

select 
    *
from fat_vendas