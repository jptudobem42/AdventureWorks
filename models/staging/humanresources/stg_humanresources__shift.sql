with

source as (

    select * from {{ source('humanresources', 'shift') }}

)

, renamed as (

    select
        shiftid
        , name
        , starttime
        , endtime
        , modifieddate

    from source

)

select * from renamed
