with 

pais as (
    select
        countryregioncode
        , name as nome_pais
    from {{ ref('stg_person__countryregion')}}
)

, estado as (
    select
        stateprovinceid
        , name as nome_estado
        , countryregioncode
    from {{ ref('stg_person__stateprovince')}}
)

, endereco as (
    select
        addressid
        , addressline1
        , city as nome_cidade
        , stateprovinceid
    from {{ ref('stg_person__address')}}
)

select
    {{ dbt_utils.generate_surrogate_key(['endereco.addressid']) }} as sk_endereco
    , addressid
    , addressline1
    , nome_cidade
    , nome_estado
    , nome_pais
from endereco
left join estado
    on estado.stateprovinceid = endereco.stateprovinceid
left join pais
    on  pais.countryregioncode = estado.countryregioncode