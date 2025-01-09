{{
    config(
        materialized = "view"
    )
}}


with
dim_dates as (

    select * from {{ ref('int_dates__translated') }}

)

select * from dim_dates
