with

source as (

    select * from {{ source('person', 'addresstype') }}

)

, renamed as (

    select
        addresstypeid
        , name
        , rowguid
        , modifieddate

    from source

)

select * from renamed
