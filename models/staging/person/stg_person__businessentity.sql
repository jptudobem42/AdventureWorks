with

source as (

    select * from {{ source('person', 'businessentity') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
