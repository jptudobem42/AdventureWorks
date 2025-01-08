with

source as (

    select * from {{ source('person', 'emailaddress') }}

)

, renamed as (

    select
        businessentityid
        , emailaddressid
        , emailaddress
        , rowguid
        , modifieddate

    from source

)

select * from renamed
