{% macro create_age_range(birth_date_column, current_date='CURRENT_DATE') %}

case
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) < 1 then 'MENOR QUE 1 ANO'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 1 and 4 then '1 A 4 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 5 and 9 then '5 A 9 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 10 and 14 then '10 A 14 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 15 and 19 then '15 A 19 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 20 and 29 then '20 A 29 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 30 and 39 then '30 A 39 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 40 and 49 then '40 A 49 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 50 and 59 then '50 A 59 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 60 and 69 then '60 A 69 ANOS'
    when floor(datediff('day', {{ birth_date_column }}, {{ current_date }}) / 365.25) between 70 and 79 then '70 A 79 ANOS'
    else '80 ANOS OU MAIS' 
end as faixa_etaria

{%- endmacro %}
