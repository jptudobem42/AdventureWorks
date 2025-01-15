with

source as (

    select * from {{ source('humanresources', 'employee') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , loginid as id_login
        , nationalidnumber
        , jobtitle
        , birthdate
        , {{ create_age_range(birth_date_column='birthdate') }}
        , case 
            when maritalstatus = 'M' then 'CASADO'
            when maritalstatus = 'S' then 'SOLTEIRO'
            else 'OUTRO'
        end estado_civil
        , hiredate as dt_hire
        , salariedflag
        , vacationhours
        , sickleavehours
        , currentflag
        , rowguid
        , organizationnode
        , case
            when gender = 'M' then 'MASCULINO'
            when gender = 'F' then 'FEMININO'
            else 'OUTRO'
        end as sexo
        , modifieddate as dt_modified

    from source

)

select * from renamed
