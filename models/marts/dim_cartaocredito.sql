with
cartaocredito as (
    select 
        creditcardid
        , cardtype
        
    from {{ ref('stg_sales__creditcard')}}
)

, salesorderheader as (
    select distinct
        creditcardid
    from {{ ref('stg_sales__salesorderheader')}}

)

select
    {{ dbt_utils.generate_surrogate_key(['cartaocredito.creditcardid'])}} as sk_cartaocredito
    , cartaocredito.creditcardid
    , cartaocredito.cardtype
from salesorderheader
inner join cartaocredito
    on cartaocredito.creditcardid = salesorderheader.creditcardid