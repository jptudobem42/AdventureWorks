with

source as (

    select * from {{ source('sales', 'creditcard') }}

)

, renamed as (

    select
        creditcardid as id_creditcard
        , cardtype
        , cardnumber
        , expmonth
        , expyear
        , modifieddate as dt_modified

    from source

)

select * from renamed
