with

source as (

    select * from {{ source('sales', 'salesorderheader') }}

)

, renamed as (

    select
        salesorderid
        , customerid
        , salespersonid
        , territoryid
        , billtoaddressid
        , shiptoaddressid
        , shipmethodid
        , creditcardid
        , currencyrateid
        , creditcardapprovalcode
        , revisionnumber
        , date(orderdate)
        , date(duedate)
        , date(shipdate)
        , status
        , onlineorderflag
        , purchaseordernumber
        , accountnumber
        , subtotal
        , taxamt
        , freight
        , totaldue
        , comment

    from source

)

select * from renamed
