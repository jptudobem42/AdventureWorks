with

source as (

    select * from {{ source('sales', 'salesorderdetail') }}

)

, renamed as (

    select
        salesorderid
        , salesorderdetailid
        , productid
        , specialofferid
        , carriertrackingnumber
        , orderqty
        , unitprice
        , unitpricediscount

    from source

)

select * from renamed
