with renamed as (

    select
        cast(ProductID as int)              as id_produto,
        cast(Name as varchar)               as nome_produto,
        cast(ProductModelID as int)         as id_modelo,
        cast(ProductSubcategoryID as int)   as id_subcategoria

    from {{ source('erp', 'PRODUCTION_PRODUCT') }}
)

select *
from renamed