with

source as (

    select * from {{ source('production', 'productsubcategory') }}

)

, renamed as (

    select
        productsubcategoryid
        , productcategoryid
        , name

    from source

)

select * from renamed
