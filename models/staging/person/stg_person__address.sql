with

source as (

    select * from {{ source('person', 'address') }}

)

, renamed as (

    select
        addressid as id_address
        , stateprovinceid as id_stateprovince
        , addressline1
        , addressline2
        , city
        , postalcode
        , spatiallocation
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
