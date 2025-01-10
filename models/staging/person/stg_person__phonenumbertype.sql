with

source as (

    select * from {{ source('person', 'phonenumbertype') }}

)

, renamed as (

    select
        phonenumbertypeid
        , name
        , modifieddate

    from source

)

select * from renamed
