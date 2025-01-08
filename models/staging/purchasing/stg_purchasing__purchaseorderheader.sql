with 

source as (

    select * from {{ source('purchasing', 'purchaseorderheader') }}

),

renamed as (

    select
        purchaseorderid,
        revisionnumber,
        status,
        employeeid,
        vendorid,
        shipmethodid,
        orderdate,
        shipdate,
        subtotal,
        taxamt,
        freight,
        modifieddate

    from source

)

select * from renamed
