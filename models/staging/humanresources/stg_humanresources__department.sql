with

source as (

    select * from {{ source('humanresources', 'department') }}

)

, renamed as (

    select
        departmentid as id_department
        , name
        , groupname
        , modifieddate as dt_modified

    from source

)

select * from renamed
