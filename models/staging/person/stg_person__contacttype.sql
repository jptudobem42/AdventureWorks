with

source as (

    select * from {{ source('person', 'contacttype') }}

)

, renamed as (

    select
        contacttypeid
        , name
        , modifieddate

    from source

)

select * from renamed