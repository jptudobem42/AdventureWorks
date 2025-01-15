with

source as (

    select * from {{ source('purchasing', 'shipmethod') }}

)

, renamed as (

    select
        shipmethodid as id_shipmethod
        , name
        , shipbase
        , shiprate
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
