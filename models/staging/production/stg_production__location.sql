with

source as (

    select * from {{ source('production', 'location') }}

)

, renamed as (

    select
        'locationid'
        , 'name'
        , 'costrate'
        , 'availability'
        , 'modifieddate'

    from source

)

select * from renamed
