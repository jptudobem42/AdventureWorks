with 

source as (

    select * from {{ source('humanresources', 'employeedepartmenthistory') }}

),

renamed as (

    select
        businessentityid,
        departmentid,
        shiftid,
        startdate,
        enddate,
        modifieddate

    from source

)

select * from renamed
