with

source as (

    select * from {{ source('sales', 'currency') }}

)

, renamed as (

    select
        currencycode
        , name
        , modifieddate as dt_modified

    from source

)

select * from renamed
