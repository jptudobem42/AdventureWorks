with

source as (

    select * from {{ source('sales', 'salesperson') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , territoryid as id_territory
        , salesquota
        , bonus
        , commissionpct
        , salesytd
        , saleslastyear
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
