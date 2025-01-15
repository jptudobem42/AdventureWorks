with

source as (

    select * from {{ source('sales', 'salesorderdetail') }}

)

, renamed as (

    select
        salesorderid as id_salesorder
        , salesorderdetailid as id_salesorderdetail
        , productid as id_product
        , specialofferid as id_specialoffer
        , carriertrackingnumber
        , orderqty as qty_order
        , unitprice
        , unitpricediscount
        , rowguid
        , modifieddate as dt_modified

    from source

)

select * from renamed
