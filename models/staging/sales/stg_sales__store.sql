with

source as (

    select * from {{ source('sales', 'store') }}

)

, renamed as (

    select
        businessentityid
        , name
        , salespersonid
        , demographics
        , rowguid
        , modifieddate

    from source

)

select * from renamed
