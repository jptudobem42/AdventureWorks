with

source as (

    select * from {{ source('production', 'transactionhistoryarchive') }}

)

, renamed as (

    select
        transactionid
        , productid
        , referenceorderid
        , referenceorderlineid
        , transactiondate
        , transactiontype
        , quantity
        , actualcost
        , modifieddate

    from source

)

select * from renamed
