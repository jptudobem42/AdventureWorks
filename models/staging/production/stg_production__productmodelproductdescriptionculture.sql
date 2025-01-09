with

source as (

    select *
    from {{ source('production', 'productmodelproductdescriptionculture') }}

)

, renamed as (

    select
        productmodelid
        , productdescriptionid
        , cultureid
        , modifieddate

    from source

)

select * from renamed
