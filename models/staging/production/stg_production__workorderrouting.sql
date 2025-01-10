with

source as (

    select * from {{ source('production', 'workorderrouting') }}

)

, renamed as (

    select
        workorderid
        , productid
        , operationsequence
        , locationid
        , scheduledstartdate
        , scheduledenddate
        , actualstartdate
        , actualenddate
        , actualresourcehrs
        , plannedcost
        , actualcost
        , modifieddate

    from source

)

select * from renamed
