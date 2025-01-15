with

source as (

    select * from {{ source('sales', 'salestaxrate') }}

)

, renamed as (

    select
        salestaxrateid as id_salestaxrate
        , stateprovinceid as id_stateprovince
        , taxtype
        , taxrate
        , name
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
