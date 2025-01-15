with

source as (

    select * from {{ source('humanresources', 'shift') }}

)

, renamed as (

    select
        shiftid as id_shiftid
        , name
        , starttime
        , endtime
        , modifieddate as dt_modified

    from source

)

select * from renamed
