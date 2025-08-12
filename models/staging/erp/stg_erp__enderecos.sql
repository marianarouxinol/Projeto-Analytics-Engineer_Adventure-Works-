with renamed as (

    select
        cast(AddressID as int)              as id_endereco,
        cast(AddressLine1 as varchar)       as Endereco,
        cast(City as varchar)               as cidade,
        cast(StateProvinceID as int)        as id_provincia

    from {{ source('erp', 'PERSON_ADDRESS') }}
)

select *
from renamed