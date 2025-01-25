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

    from source

)

select * from renamed
