with

source as (

    select * from {{ source('person', 'businessentitycontact') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , personid as id_person
        , contacttypeid as id_contacttype
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
