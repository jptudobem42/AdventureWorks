with

source as (

    select * from {{ source('sales', 'store') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , name
        , salespersonid as id_salesperson
        , demographics
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
