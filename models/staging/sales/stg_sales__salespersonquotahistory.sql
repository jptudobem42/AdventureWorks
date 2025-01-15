with

source as (

    select * from {{ source('sales', 'salespersonquotahistory') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , date(quotadate) as dt_quota
        , salesquota
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
