with

source as (

    select * from {{ source('sales', 'salesterritory') }}

)

, renamed as (

    select
        territoryid as id_territory
        , name
        , countryregioncode
        , "group" as grupo
        , salesytd
        , saleslastyear
        , costytd
        , costlastyear
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
