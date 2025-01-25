with  
razoesvendas as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as sk_razoesvenda
        , salesorderid
        , {{ generate_reason_indicators('reason_name') }}
    from {{ ref('int_salesreasons_agg') }}
)

select 
    *
from razoesvendas