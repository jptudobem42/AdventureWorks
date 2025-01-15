with

source as (

    select * from {{ source('person', 'addresstype') }}

)

, renamed as (

    select
        addresstypeid as id_addresstype
        , name
        , rowguid
        , date(modifieddate) as dt_modified

    from source

)

select * from renamed
