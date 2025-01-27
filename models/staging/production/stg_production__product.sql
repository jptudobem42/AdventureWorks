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
        , case
            when color is null then 'N/A'
            else color
        end as color
        , safetystocklevel
        , reorderpoint
        , standardcost
        , listprice
        , sizeunitmeasurecode
        , weightunitmeasurecode
        , weight
        , daystomanufacture
        , productline
        , case
            when class is null then 'N/A'
            else class
        end as class
        , style
        , productsubcategoryid
        , case
            when productmodelid is null then 0
            else productmodelid
        end as productmodelid
        , sellstartdate
        , sellenddate
        , discontinueddate

    from source

)

select * from renamed
