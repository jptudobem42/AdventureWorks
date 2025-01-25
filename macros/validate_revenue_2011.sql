{% test validate_revenue_2011(model) %}
    with sales_2011 as (
        select 
            round(sum(revenue), 2) as total_revenue
        from {{ model }}
        where date_part('year', orderdate) = 2011
    )
    select *
    from sales_2011
    where total_revenue != 12646112.16
{% endtest %}