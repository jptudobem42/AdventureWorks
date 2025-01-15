with

source as (

    select * from {{ source('purchasing', 'vendor') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , accountnumber
        , name
        , creditrating
        , preferredvendorstatus
        , activeflag
        , purchasingwebserviceurl
        , modifieddate as dt_modified

    from source

)

select * from renamed
