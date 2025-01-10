with

source as (

    select * from {{ source('production', 'productmodel') }}

)

, renamed as (

    select
        productmodelid
        , name
        , catalogdescription
        , instructions
        , rowguid
        , modifieddate

    from source

)

select * from renamed
