with

source as (

    select * from {{ source('sales', 'salesorderheader') }}

)

, renamed as (

    select
        salesorderid as id_salesorder
        , customerid as id_customer
        , salespersonid as id_salesperson
        , territoryid as id_territory
        , billtoaddressid as id_billtoaddress
        , shiptoaddressid as id_shiptoaddress
        , shipmethodid as id_shipmethod
        , creditcardid as id_creditcard
        , currencyrateid as id_currencyrate
        , creditcardapprovalcode
        , revisionnumber
        , date(orderdate) as dt_order
        , date(duedate) as dt_due
        , date(shipdate) as dt_ship
        , status
        , onlineorderflag
        , purchaseordernumber
        , accountnumber
        , subtotal
        , taxamt
        , freight
        , totaldue
        , comment
        , rowguid
        , modifieddate

    from source

)

select * from renamed
