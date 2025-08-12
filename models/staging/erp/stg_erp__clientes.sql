with renamed as (

    select
        cast(CustomerID as int)         as id_cliente,
        cast(PersonID as int)           as id_pessoa,
        cast(StoreID as int)            as id_loja,
        cast(TerritoryID as int)        as id_territorio

    from {{ source('erp', 'SALES_CUSTOMER') }}
    where PersonID is not null

)

select *
from renamed