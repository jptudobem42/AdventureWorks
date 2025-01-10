with

source as (

    select * from {{ source('sales', 'salesterritoryhistory') }}

)

, renamed as (

    select
        businessentityid
        , territoryid
        , startdate
        , enddate
        , rowguid
        , modifieddate

    from source

)

select * from renamed
