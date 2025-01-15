with

source as (

    select * from {{ source('sales', 'salesreason') }}

)

, renamed as (

    select
        salesreasonid as id_salesreason
        , name
        , reasontype
        , modifieddate as dt_modified

    from source

)

select * from renamed
