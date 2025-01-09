with

source as (

    select * from {{ source('production', 'workorder') }}

)

, renamed as (

    select
        workorderid
        , productid
        , orderqty
        , scrappedqty
        , startdate
        , enddate
        , duedate
        , scrapreasonid
        , modifieddate

    from source

)

select * from renamed
