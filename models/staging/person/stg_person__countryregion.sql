with

source as (

    select * from {{ source('person', 'countryregion') }}

)

, renamed as (

    select
        countryregioncode
        , name
        , modifieddate as dt_modified

    from source

)

select * from renamed
