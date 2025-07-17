with renamed as (

    select
        cast(BusinessEntityID as int)   as id_vendedor,
        cast(TerritoryID as int)        as id_territorio,
        cast(Bonus as numeric)          as valor_bonus

    from {{ source('erp', 'SALES_SALESPERSON') }}
)

select *
from renamed