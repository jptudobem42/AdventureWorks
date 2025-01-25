{% macro generate_reason_indicators(array_column) %}
    {% set reasons = dbt_utils.get_column_values(
        ref('stg_sales__salesreason'),
        'name'
    ) %}

    {% for reason in reasons %}
        case 
            when array_to_string({{ array_column }}, ',') like '%{{ reason }}%' then 1
            else 0
        end as "{{ reason | upper | replace(' ', '_') | replace('__', '_') }}"
        {% if not loop.last %}, {% endif %}
    {% endfor %}
{% endmacro %}