with

source as (

    select * from {{ source('production', 'productdescription') }}

)

, renamed as (

    select
        productdescriptionid
        , description
        , rowguid
        , modifieddate

    from source

)

select * from renamed
