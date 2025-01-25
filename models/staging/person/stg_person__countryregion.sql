with

source as (

    select * from {{ source('person', 'countryregion') }}

)

, renamed as (

    select
        countryregioncode
        , name

    from source

)

select * from renamed
