with

source as (

    select * from {{ source('person', 'personphone') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , phonenumbertypeid as id_phonenumbertype
        , phonenumber
        , modifieddate as dt_modified

    from source

)

select * from renamed
