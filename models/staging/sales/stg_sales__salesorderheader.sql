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
        , coalesce(creditcardid, -1) as creditcardid
        , currencyrateid
        , creditcardapprovalcode
        , revisionnumber
        , date(orderdate) as orderdate
        , date(duedate) as duedate
        , date(shipdate) as shipdate
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
