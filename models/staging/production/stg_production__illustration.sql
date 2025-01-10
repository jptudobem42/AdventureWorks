with

source as (

    select * from {{ source('production', 'illustration') }}

)

, renamed as (

    select
        illustrationid
        , diagram
        , modifieddate

    from source

)

select * from renamed
