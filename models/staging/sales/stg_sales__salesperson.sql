with

source as (

    select * from {{ source('sales', 'salesperson') }}

)

, renamed as (

    select
        businessentityid
        , territoryid
        , salesquota
        , bonus
        , commissionpct
        , salesytd
        , saleslastyear

    from source

)

select * from renamed
