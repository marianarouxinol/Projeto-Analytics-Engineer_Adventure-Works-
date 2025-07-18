with renamed as (

    select
        cast(ProductSubcategoryID as int)   as id_subcategoria,
        cast(Name as varchar)               as nome_subcategoria,
        cast(ProductCategoryID as int)      as id_categoria

    from {{ source('erp', 'PRODUCTION_PRODUCTSUBCATEGORY') }}
)

select *
from renamed