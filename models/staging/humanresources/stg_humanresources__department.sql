with 

source as (

    select * from {{ source('humanresources', 'department') }}

),

renamed as (

    select
        departmentid,
        name,
        groupname,
        modifieddate

    from source

)

select * from renamed
