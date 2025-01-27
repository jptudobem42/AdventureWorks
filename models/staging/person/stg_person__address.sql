with

source as (

    select * from {{ source('person', 'address') }}

)

, renamed as (

    select
        addressid 
        , stateprovinceid
        , addressline1
        , addressline2
        , city
        , postalcode
        , spatiallocation

    from source

)

select * from renamed
