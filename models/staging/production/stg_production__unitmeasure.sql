with

source as (

    select * from {{ source('production', 'unitmeasure') }}

)

, renamed as (

    select
        unitmeasurecode
        , name
        , modifieddate

    from source

)

select * from renamed
