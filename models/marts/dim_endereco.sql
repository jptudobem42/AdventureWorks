with 

pais as (
    select
        countryregioncode
        , name
    from {{ ref('stg_person__countryregion')}}
)

, estado as (
    select
        stateprovinceid
        , name
        , countryregioncode
    from {{ ref('stg_person__stateprovince')}}
)

, endereco as (
    select
        addressid
        , addressline1
        , city
        , stateprovinceid
    from {{ ref('stg_person__address')}}
)

select
    {{ dbt_utils.generate_surrogate_key(['endereco.addressid']) }} as sk_endereco
    , addressid
    , addressline1
    , city
    , statename
    , countryname
from endereco
left join estado
    on estado.stateprovinceid = endereco.stateprovinceid
left join pais
    on  pais.countryregioncode = estado.countryregioncode