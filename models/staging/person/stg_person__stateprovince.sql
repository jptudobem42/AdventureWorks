with

source as (

    select * from {{ source('person', 'stateprovince') }}

)

, renamed as (

    select
        stateprovinceid
        , stateprovincecode
        , countryregioncode
        , isonlystateprovinceflag
        , name
        , territoryid
        , rowguid
        , modifieddate

    from source

)

select * from renamed
