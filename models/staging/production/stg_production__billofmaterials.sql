with

source as (

    select * from {{ source('production', 'billofmaterials') }}

)

, renamed as (

    select
        'billofmaterialsid'
        , 'productassemblyid'
        , 'componentid'
        , 'startdate'
        , 'enddate'
        , 'unitmeasurecode'
        , 'bomlevel'
        , 'perassemblyqty'
        , 'modifieddate'

    from source

)

select * from renamed
