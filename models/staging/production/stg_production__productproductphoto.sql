with

source as (

    select * from {{ source('production', 'productproductphoto') }}

)

, renamed as (

    select
        productid
        , productphotoid
        , 'primary'
        , modifieddate

    from source

)

select * from renamed
