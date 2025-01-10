with

source as (

    select * from {{ source('sales', 'salestaxrate') }}

)

, renamed as (

    select
        salestaxrateid
        , stateprovinceid
        , taxtype
        , taxrate
        , name
        , rowguid
        , modifieddate

    from source

)

select * from renamed
