with

source as (

    select * from {{ source('person', 'contacttype') }}

)

, renamed as (

    select
        contacttypeid as id_contacttype
        , name
        , modifieddate as dt_modified

    from source

)

select * from renamed
