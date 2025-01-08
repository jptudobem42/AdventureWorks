with 

source as (

    select * from {{ source('humanresources', 'employeepayhistory') }}

),

renamed as (

    select
        businessentityid,
        ratechangedate,
        rate,
        payfrequency,
        modifieddate

    from source

)

select * from renamed
