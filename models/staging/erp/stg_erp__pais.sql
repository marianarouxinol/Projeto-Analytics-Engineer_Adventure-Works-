with renamed as (

    select
        cast(CountryRegionCode as varchar)  as codigo_pais,
        cast(Name as varchar)               as nome_pais

    from {{ source('erp', 'PERSON_COUNTRYREGION') }}
)

select *
from renamed