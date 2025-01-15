with

source as (

    select * from {{ source('person', 'stateprovince') }}

)

, renamed as (

    select
        stateprovinceid as id_stateprovince
        , territoryid as id_territory
        , stateprovincecode
        , countryregioncode
        , isonlystateprovinceflag
        , name
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
