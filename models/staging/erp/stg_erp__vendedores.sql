with base as (

    select
        businessentityid,
        territoryid,
        bonus,
        salesquota
    from {{ source('erp', 'SALES_SALESPERSON') }}
    where businessentityid is not null

),

deduplicado as (

    select *
    from base
    qualify row_number() over (partition by businessentityid order by territoryid) = 1

),

renamed as (

    select
        cast(businessentityid as int)   as id_vendedor,
        cast(territoryid as int)        as id_territorio,
        cast(bonus as numeric)          as valor_bonus,
        cast(salesquota as float)       as quota_vendas
    from deduplicado

)

select *
from renamed