with

source as (

    select * from {{ source('humanresources', 'employeepayhistory') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , date(ratechangedate) as dt_ratechange
        , rate
        , payfrequency
        , modifieddate as dt_modified

    from source

)

select * from renamed
