{% test validate_revenue_by_year(model, year, expected_value) %}
    with sales as (
        select 
            round(sum({{ kwargs["column_name"] }}), 2) as total_revenue
        from {{ model }}
        where date_part('year', orderdate) = {{ year }}
    )
    select *
    from sales
    where total_revenue != {{ expected_value }}
{% endtest %}