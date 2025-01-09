with

source as (

    select * from {{ source('production', 'productinventory') }}

)

, renamed as (

    select
        productid
        , locationid
        , shelf
        , bin
        , quantity
        , rowguid
        , modifieddate

    from source

)

select * from renamed
