with renamed as (

    select
        cast(TerritoryID as int)          as id_territorio,
        cast(Name as varchar)             as nome_territorio,
        cast(CountryRegionCode as varchar) as codigo_pais,
        cast("group" as varchar)          as grupo_comercial

    from {{ source('erp', 'SALES_SALESTERRITORY') }}
)

select *
from renamed