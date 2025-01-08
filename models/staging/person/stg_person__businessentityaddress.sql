with 

source as (

    select * from {{ source('person', 'businessentityaddress') }}

),

renamed as (

    select
        businessentityid,
        addressid,
        addresstypeid,
        rowguid,
        modifieddate

    from source

)

select * from renamed
