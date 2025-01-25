with

source as (

    select * from {{ source('sales', 'salesreason') }}

)

, renamed as (

    select
        salesreasonid
        , name
        , reasontype

    from source

)

select * from renamed
