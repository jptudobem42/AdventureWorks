with

source as (

    select * from {{ source('person', 'personphone') }}

)

, renamed as (

    select
        businessentityid
        , phonenumber
        , phonenumbertypeid
        , modifieddate

    from source

)

select * from renamed
