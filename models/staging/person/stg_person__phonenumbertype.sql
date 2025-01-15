with

source as (

    select * from {{ source('person', 'phonenumbertype') }}

)

, renamed as (

    select
        phonenumbertypeid as id_phonenumbertype
        , name
        , modifieddate as dt_modified

    from source

)

select * from renamed
