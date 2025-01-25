with

source as (

    select * from {{ source('sales', 'customer') }}

)

, renamed as (

    select
        customerid
        , personid
        , storeid
        , territoryid

    from source

)

select * from renamed
