with
reasons as (
    select
        salesorderid
        , {{ dbt_utils.generate_surrogate_key(['value']) }} as sk_razao
        , 1.0 / count(*) over(partition by salesorderid) as peso
    from {{ ref('int_salesreasons_agg') }}
    , lateral flatten(input => reason_name)
)

, fat_vendas as (
    select
        salesorderid
        , orderdate
        , revenue
        , revenue_discounted
    from {{ref('fat_vendas')}}
)

, agg as (
    select
        reasons.sk_razao
        , fat_vendas.orderdate
        , sum(reasons.peso) as qtd_pedidos
        , round(sum(reasons.peso * fat_vendas.revenue), 2) as revenue
        , round(sum(reasons.peso * fat_vendas.revenue_discounted), 2) as revenue_discounted
    from reasons
    inner join fat_vendas
        on fat_vendas.salesorderid = reasons.salesorderid
    group by all
)

select * from agg