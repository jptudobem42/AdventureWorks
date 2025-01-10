with

source as (

    select * from {{ source('production', 'productcategory') }}

)

, renamed as (

    select
        productcategoryid
        , name
        , rowguid
        , modifieddate

    from source

)

select * from renamed
