with

source as (

    select * from {{ source('sales', 'personcreditcard') }}

)

, renamed as (

    select
        businessentityid as id_businessentity
        , creditcardid as id_creditcard
        , modifieddate as dt_modified

    from source

)

select * from renamed
