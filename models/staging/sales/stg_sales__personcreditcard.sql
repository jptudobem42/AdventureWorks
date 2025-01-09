with

source as (

    select * from {{ source('sales', 'personcreditcard') }}

)

, renamed as (

    select
        businessentityid
        , creditcardid
        , modifieddate

    from source

)

select * from renamed
