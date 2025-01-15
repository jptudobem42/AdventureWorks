with

source as (

    select * from {{ source('purchasing', 'purchaseorderdetail') }}

)

, renamed as (

    select
        "purchaseorderid" as id_purchaseorder
        , "purchaseorderdetailid" as id_purchaseorderdetail
        , "productid" as id_product
        , "duedate" as duedate
        , "unitprice" as unitprice
        , "orderqty" as qty_order
        , "receivedqty" as qty_received
        , "rejectedqty" as qty_rejected
        , "modifieddate" as dt_modified

    from source

)

select * from renamed
