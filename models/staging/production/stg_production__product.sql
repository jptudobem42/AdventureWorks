with

source as (

    select * from {{ source('production', 'product') }}

)

, renamed as (

    select
        productid
        , name
        , productnumber
        , makeflag
        , finishedgoodsflag
        , color
        , safetystocklevel
        , reorderpoint
        , standardcost
        , listprice
        , sizeunitmeasurecode
        , weightunitmeasurecode
        , weight
        , daystomanufacture
        , productline
        , class
        , style
        , productsubcategoryid
        , productmodelid
        , sellstartdate
        , sellenddate
        , discontinueddate

    from source

)

select * from renamed
