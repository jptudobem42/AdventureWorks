with

source as (

    select * from {{ source('production', 'productcategory') }}

)

, renamed as (

    select
        productcategoryid
        , name

    from source

)

select * from renamed
