with

source as (

    select * from {{ source('production', 'productcosthistory') }}

)

, renamed as (

    select
        productid
        , startdate
        , enddate
        , standardcost
        , modifieddate

    from source

)

select * from renamed
