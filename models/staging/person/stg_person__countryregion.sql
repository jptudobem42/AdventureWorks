with

source as (

    select * from {{ source('person', 'countryregion') }}

)

, renamed as (

    select
        countryregioncode
        , name
        , modifieddate

    from source

)

select * from renamed
