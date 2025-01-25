with

salesorderheadersalesreason as (
    select distinct 
        salesorderid
        , salesreasonid
    from {{ ref('stg_sales__salesorderheadersalesreason') }}
)

, salesreason as (

    select 
        salesreasonid
        , name
        , reasontype
    from {{ ref('stg_sales__salesreason') }}
)

, salesreasons_agg as (
    select
        salesorderheadersalesreason.salesorderid
        , array_agg(salesreason.name) as reason_name
    from salesorderheadersalesreason
    left join salesreason
        on salesreason.salesreasonid = salesorderheadersalesreason.salesreasonid
    group by salesorderheadersalesreason.salesorderid
)

select
    salesorderid
    , {{ generate_reason_indicators('reason_name') }}
from salesreasons_agg