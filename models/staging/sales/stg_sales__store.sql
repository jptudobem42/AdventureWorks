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

    from source

)

select * from renamed
