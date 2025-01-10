with

source as (

    select * from {{ source('production', 'productsubcategory') }}

)

, renamed as (

    select
        productsubcategoryid
        , productcategoryid
        , name
        , rowguid
        , modifieddate

    from source

)

select * from renamed
