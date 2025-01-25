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
        , concat(firstname, ' ', lastname) as fullname
        , suffix
        , emailpromotion
        , additionalcontactinfo
        , demographics

    from source

)

select * from renamed
