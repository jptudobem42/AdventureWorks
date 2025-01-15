with

source as (

    select * from {{ source('humanresources', 'jobcandidate') }}

)

, renamed as (

    select
        jobcandidateid as id_jobcandidate
        , businessentityid as id_businessentity
        , resume
        , modifieddate as dt_modified

    from source

)

select * from renamed
