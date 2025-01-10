with

source as (

    select * from {{ source('production', 'productdocument') }}

)

, renamed as (

    select
        productid
        , modifieddate
        , documentnode

    from source

)

select * from renamed
