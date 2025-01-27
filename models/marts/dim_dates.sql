with
raw_generated_data as (
    {{ dbt_date.get_date_dimension(var('start_date'), var('end_date')) }}
)

, translated_data as (
    select
        raw_generated_data.*
        , case
            when raw_generated_data.day_of_week = 1 then 'Domingo'
            when raw_generated_data.day_of_week = 2 then 'Segunda-feira'
            when raw_generated_data.day_of_week = 3 then 'Terça-feira'
            when raw_generated_data.day_of_week = 4 then 'Quarta-feira'
            when raw_generated_data.day_of_week = 5 then 'Quinta-feira'
            when raw_generated_data.day_of_week = 6 then 'Sexta-feira'
            when raw_generated_data.day_of_week = 7 then 'Sábado'
        end as day_of_week_name_ptbr
        , case
            when raw_generated_data.day_of_week = 1 then 'Dom'
            when raw_generated_data.day_of_week = 2 then 'Seg'
            when raw_generated_data.day_of_week = 3 then 'Ter'
            when raw_generated_data.day_of_week = 4 then 'Qua'
            when raw_generated_data.day_of_week = 5 then 'Qui'
            when raw_generated_data.day_of_week = 6 then 'Sex'
            when raw_generated_data.day_of_week = 7 then 'Sab'
        end as day_of_week_name_shc_ptbr
        , case
            when raw_generated_data.month_of_year = 1 then 'Janeiro'
            when raw_generated_data.month_of_year = 2 then 'Fevereiro'
            when raw_generated_data.month_of_year = 3 then 'Março'
            when raw_generated_data.month_of_year = 4 then 'Abril'
            when raw_generated_data.month_of_year = 5 then 'Maio'
            when raw_generated_data.month_of_year = 6 then 'Junho'
            when raw_generated_data.month_of_year = 7 then 'Julho'
            when raw_generated_data.month_of_year = 8 then 'Agosto'
            when raw_generated_data.month_of_year = 9 then 'Setembro'
            when raw_generated_data.month_of_year = 10 then 'Outubro'
            when raw_generated_data.month_of_year = 11 then 'Novembro'
            when raw_generated_data.month_of_year = 12 then 'Dezembro'
        end as month_name_ptbr
        , case
            when raw_generated_data.month_of_year = 1 then 'Jan'
            when raw_generated_data.month_of_year = 2 then 'Fev'
            when raw_generated_data.month_of_year = 3 then 'Mar'
            when raw_generated_data.month_of_year = 4 then 'Abr'
            when raw_generated_data.month_of_year = 5 then 'Mai'
            when raw_generated_data.month_of_year = 6 then 'Jun'
            when raw_generated_data.month_of_year = 7 then 'Jul'
            when raw_generated_data.month_of_year = 8 then 'Ago'
            when raw_generated_data.month_of_year = 9 then 'Set'
            when raw_generated_data.month_of_year = 10 then 'Out'
            when raw_generated_data.month_of_year = 11 then 'Nov'
            when raw_generated_data.month_of_year = 12 then 'Dez'
        end as month_name_short_ptbr
    from raw_generated_data
)

select *
from translated_data