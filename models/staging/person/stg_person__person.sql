with

source as (

    select * from {{ source('person', 'person') }}

)

, renamed as (

    select
        businessentityid
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
        , modifieddate

    from source

)

select * from renamed
