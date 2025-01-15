with

source as (

    select * from {{ source('sales', 'salesterritoryhistory') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , territoryid as id_territory
        , date(startdate) as dt_start
        , date(enddate) as dt_end
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
