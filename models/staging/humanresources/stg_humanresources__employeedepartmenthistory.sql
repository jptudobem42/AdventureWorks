with

source as (

    select * from {{ source('humanresources', 'employeedepartmenthistory') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , departmentid as id_department
        , shiftid as id_shift
        , startdate
        , enddate
        , modifieddate as dt_modified

    from source

)

select * from renamed
