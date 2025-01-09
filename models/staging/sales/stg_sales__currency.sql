with

source as (

    select * from {{ source('sales', 'currency') }}

)

, renamed as (

    select
        currencycode
        , name
        , modifieddate

    from source

)

select * from renamed
