with

source as (

    select * from {{ source('production', 'scrapreason') }}

)

, renamed as (

    select
        scrapreasonid
        , name
        , modifieddate

    from source

)

select * from renamed
