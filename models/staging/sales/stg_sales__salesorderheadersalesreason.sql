with

source as (

    select * from {{ source('sales', 'salesorderheadersalesreason') }}

)

, renamed as (

    select
        salesorderid
        , salesreasonid

    from source

)

select * from renamed
