with

source as (

    select * from {{ source('purchasing', 'purchaseorderdetail') }}

)

, renamed as (

    select
        purchaseorderid
        , purchaseorderdetailid
        , duedate
        , orderqty
        , productid
        , unitprice
        , receivedqty
        , rejectedqty
        , modifieddate

    from source

)

select * from renamed
