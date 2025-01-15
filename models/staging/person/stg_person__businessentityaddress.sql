with

source as (

    select * from {{ source('person', 'businessentityaddress') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , addressid as id_address
        , addresstypeid as id_addresstype
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
