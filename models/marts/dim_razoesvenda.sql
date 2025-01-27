with razoesvendas as (
    select
        distinct value as nomerazao,
        {{ dbt_utils.generate_surrogate_key(['value']) }} as sk_razao
    from {{ ref('int_salesreasons_agg') }}
    , lateral flatten(input => reason_name)
)

select 
    sk_razao
    , nomerazao
from razoesvendas