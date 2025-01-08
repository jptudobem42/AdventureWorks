with 

source as (

    select * from {{ source('person', 'businessentitycontact') }}

),

renamed as (

    select
        businessentityid,
        personid,
        contacttypeid,
        rowguid,
        modifieddate

    from source

)

select * from renamed
