with

source as (

    select * from {{ source('sales', 'salesorderdetail') }}

)

, renamed as (

    select
        salesorderid
        , salesorderdetailid
        , carriertrackingnumber
        , orderqty
        , productid
        , specialofferid
        , unitprice
        , unitpricediscount
        , rowguid
        , modifieddate

    from source

)

select * from renamed
