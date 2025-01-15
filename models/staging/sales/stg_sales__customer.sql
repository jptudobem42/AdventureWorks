with

source as (

    select * from {{ source('sales', 'customer') }}

)

, renamed as (

    select
        customerid as id_customer
        , personid as id_person
        , storeid as id_store
        , territoryid as id_territory
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
