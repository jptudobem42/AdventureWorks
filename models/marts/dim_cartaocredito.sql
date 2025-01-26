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
    {{ dbt_utils.generate_surrogate_key(['salesorderheader.creditcardid'])}} as sk_cartaocredito
    , salesorderheader.creditcardid
    , coalesce(cartaocredito.cardtype, 'No Card') as cardtype
from salesorderheader
left join cartaocredito
    on cartaocredito.creditcardid = salesorderheader.creditcardid