with 

source as (

    select * from {{ source('purchasing', 'productvendor') }}

),

renamed as (

    select
        productid,
        businessentityid,
        averageleadtime,
        standardprice,
        lastreceiptcost,
        lastreceiptdate,
        minorderqty,
        maxorderqty,
        onorderqty,
        unitmeasurecode,
        modifieddate

    from source

)

select * from renamed
