with

source as (

    select * from {{ source('person', 'person') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , persontype
        , namestyle
        , title
        , firstname
        , middlename
        , lastname
        , suffix
        , emailpromotion
        , additionalcontactinfo
        , demographics
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
