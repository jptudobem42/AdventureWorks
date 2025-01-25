with

source as (

    select * from {{ source('sales', 'salesterritory') }}

)

, renamed as (

    select
        territoryid
        , name
        , countryregioncode
        , "group" as grupo
        , salesytd
        , saleslastyear
        , costytd
        , costlastyear

    from source

)

select * from renamed
