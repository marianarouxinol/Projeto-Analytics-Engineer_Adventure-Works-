with renamed as (

    select
        cast(StateProvinceID as int)        as id_provincia,
        cast(Name as varchar)               as nome_provincia,
        cast(CountryRegionCode as varchar)  as codigo_pais

    from {{ source('erp', 'PERSON_STATEPROVINCE') }}
)

select *
from renamed