with

source as (

    select * from {{ source('sales', 'currencyrate') }}

)

, renamed as (

    select
        currencyrateid as id_currencyrate
        , date(currencyratedate) as dt_currencyrate
        , fromcurrencycode
        , tocurrencycode
        , averagerate
        , endofdayrate
        , modifieddate as dt_modified

    from source

)

select * from renamed
