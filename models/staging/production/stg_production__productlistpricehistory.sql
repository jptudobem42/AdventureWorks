with

source as (

    select * from {{ source('production', 'productlistpricehistory') }}

)

, renamed as (

    select
        productid
        , startdate
        , enddate
        , listprice
        , modifieddate

    from source

)

select * from renamed
