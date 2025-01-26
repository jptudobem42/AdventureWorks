with razoes as (
    select
        distinct value as motivo
        , {{ dbt_utils.generate_surrogate_key(['value']) }} as sk_razao
    from {{ ref('int_salesreasons_agg') }}
    , lateral flatten(input => reason_name)
)

select 
    sk_razao,
    motivo
from razoes
