with

source as (

    select * from {{ source('sales', 'creditcard') }}

)

, renamed as (

    select
        coalesce(creditcardid, -1) as creditcardid
        , coalesce(cardtype, 'N/A') as cardtype
        , cardnumber
        , expmonth
        , expyear

    from source

)

select * from renamed
