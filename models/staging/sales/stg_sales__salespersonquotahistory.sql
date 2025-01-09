with

source as (

    select * from {{ source('sales', 'salespersonquotahistory') }}

)

, renamed as (

    select
        businessentityid
        , quotadate
        , salesquota
        , rowguid
        , modifieddate

    from source

)

select * from renamed
