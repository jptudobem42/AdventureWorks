with

source as (

    select * from {{ source('purchasing', 'productvendor') }}

)

, renamed as (

    select
        productid as id_product
        , businessentityid as id_businessentity
        , averageleadtime
        , standardprice
        , lastreceiptcost
        , lastreceiptdate
        , minorderqty as qty_minorder
        , maxorderqty as qty_maxorder
        , onorderqty as qty_onorder
        , unitmeasurecode
        , modifieddate as dt_modified

    from source

)

select * from renamed
