with
dim_dates as (

    select * from {{ ref('int_dates_translated') }}

)

select * from dim_dates
