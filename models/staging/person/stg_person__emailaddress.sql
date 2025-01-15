with

source as (

    select * from {{ source('person', 'emailaddress') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , emailaddressid as id_emailaddress
        , emailaddress
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
