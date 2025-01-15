with

source as (

    select * from {{ source('sales', 'salesorderheadersalesreason') }}

)

, renamed as (

    select
        salesorderid as id_salesorder
        , salesreasonid as id_salesreason
        , modifieddate as dt_modified

    from source

)

select * from renamed
