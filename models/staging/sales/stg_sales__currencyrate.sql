with

source as (

    select * from {{ source('sales', 'currencyrate') }}

)

, renamed as (

    select
        currencyrateid
        , currencyratedate
        , fromcurrencycode
        , tocurrencycode
        , averagerate
        , endofdayrate
        , modifieddate

    from source

)

select * from renamed
