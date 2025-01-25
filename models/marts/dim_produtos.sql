with

produto as (

    select
        productid
        , name
        , productsubcategoryid
        , productmodelid
        , productnumber
        , color
        , class
    from {{ ref('stg_production__product') }}
)

, produto_categoria as (

    select
        productcategoryid
        , name
    from {{ ref('stg_production__productcategory') }}
)

, produto_subcategoria as (

    select
        productsubcategoryid
        , name
        , productcategoryid
    from {{ ref('stg_production__productsubcategory') }}
)

, produto_modelo as (

    select
        productmodelid
        , name_modelo
    from {{ ref('stg_production__productmodel') }}
)


select

    {{ dbt_utils.generate_surrogate_key(['produto.productid']) }} as sk_produto
    , produto.productid
    , produto.name as nome_prodto
    , produto.productnumber
    , produto.color
    , produto.class
    , produto_subcategoria.name as nome_subcategoria
    , produto_categoria.name as nome_categoria
from produto
left join produto_subcategoria
    on produto.productsubcategoryid = produto_subcategoria.productsubcategoryid
left join produto_categoria
    on produto_subcategoria.productcategoryid = produto_categoria.productcategoryid
left join produto_modelo
    on produto_modelo.productmodelid = produto.productmodelid
