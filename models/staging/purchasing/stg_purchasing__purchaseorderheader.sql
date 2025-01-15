with

source as (

    select * from {{ source('purchasing', 'purchaseorderheader') }}

)

, renamed as (

    select
        purchaseorderid as id_purchaseorder
        , employeeid as id_employee
        , vendorid as id_vendor
        , shipmethodid as id_shipmethod
        , revisionnumber
        , status
        , orderdate
        , shipdate
        , subtotal
        , taxamt
        , freight
        , modifieddate as dt_modified

    from source

)

select * from renamed
