with

source as (

    select * from {{ source('sales', 'creditcard') }}

)

, renamed as (

    select
        creditcardid
        , cardtype
        , cardnumber
        , expmonth
        , expyear
        , modifieddate

    from source

)

select * from renamed
