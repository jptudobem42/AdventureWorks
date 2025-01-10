with

source as (

    select * from {{ source('production', 'productmodelillustration') }}

)

, renamed as (

    select
        productmodelid
        , illustrationid
        , modifieddate

    from source

)

select * from renamed
