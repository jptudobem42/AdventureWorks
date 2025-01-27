with

source as (

    select * from {{ source('person', 'stateprovince') }}

)

, renamed as (

    select
        stateprovinceid
        , territoryid
        , stateprovincecode
        , countryregioncode
        , isonlystateprovinceflag
        , name

    from source

)

select * from renamed
