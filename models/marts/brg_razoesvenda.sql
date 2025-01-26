with brg_base as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesorderid', 'value']) }} as sk_brg_razoesvenda
        , {{ dbt_utils.generate_surrogate_key(['value']) }} as sk_razao
        , salesorderid
        , value as motivo
    from {{ ref('int_salesreasons_agg') }}
    , lateral flatten(input => reason_name)
)

select 
    sk_brg_razoesvenda
    , sk_razao
    , salesorderid
from brg_base
