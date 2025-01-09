with

source as (

    select * from {{ source('humanresources', 'jobcandidate') }}

)

, renamed as (

    select
        jobcandidateid
        , businessentityid
        , resume
        , modifieddate

    from source

)

select * from renamed
