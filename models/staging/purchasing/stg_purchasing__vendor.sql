with

source as (

    select * from {{ source('purchasing', 'vendor') }}

)

, renamed as (

    select
        businessentityid
        , accountnumber
        , name
        , creditrating
        , preferredvendorstatus
        , activeflag
        , purchasingwebserviceurl
        , modifieddate

    from source

)

select * from renamed
