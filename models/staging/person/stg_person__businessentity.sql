with 

source as (

    select * from {{ source('person', 'businessentity') }}

),

renamed as (

    select
        businessentityid,
        rowguid,
        modifieddate

    from source

)

select * from renamed
