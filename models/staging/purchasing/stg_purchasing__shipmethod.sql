with

source as (

    select * from {{ source('purchasing', 'shipmethod') }}

)

, renamed as (

    select
        shipmethodid
        , name
        , shipbase
        , shiprate
        , rowguid
        , modifieddate

    from source

)

select * from renamed
