with

salesorderheader as (
    select distinct 
        salesorderid
    from {{ ref('stg_sales__salesorderheader') }}
)

, salesorderheadersalesreason as (
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
        salesorderheader.salesorderid
        , case 
            when array_size(array_agg(salesreason.name)) = 0 then array_construct('N/A')
            else array_agg(salesreason.name)
        end as reason_name
    from salesorderheader
    left join salesorderheadersalesreason
        on salesorderheader.salesorderid = salesorderheadersalesreason.salesorderid
    left join salesreason
        on salesreason.salesreasonid = salesorderheadersalesreason.salesreasonid
    group by salesorderheader.salesorderid
)

select
    salesorderid
    , reason_name
from salesreasons_agg
