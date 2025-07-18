select
    productcategoryid as id_categoria,
    name as nome_categoria
from {{ source('erp', 'PRODUCTION_PRODUCTCATEGORY') }}