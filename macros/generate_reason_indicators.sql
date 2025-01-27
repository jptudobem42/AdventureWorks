{% macro generate_reason_indicators(array_column, prefix='REASON_') %}
    {% set reasons = dbt_utils.get_column_values(
        ref('stg_sales__salesreason'),
        'name'
    ) %}
    case 
        when array_size({{ array_column }}) = 0 then 1
        else 0
    end as "NO_REASON",
    
    {% for reason in reasons %}
        case 
            when array_to_string({{ array_column }}, ',') like '%{{ reason }}%' then 1
            else 0
        end as "{{ prefix }}{{ reason | upper | replace(' ', '_') | replace('__', '_') }}"
        {% if not loop.last %}, {% endif %}
    {% endfor %}
{% endmacro %}