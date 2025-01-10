with

source as (

    select * from {{ source('production', 'culture') }}

)

, renamed as (

    select
        cultureid
        , name
        , modifieddate

    from source

)

select * from renamed
