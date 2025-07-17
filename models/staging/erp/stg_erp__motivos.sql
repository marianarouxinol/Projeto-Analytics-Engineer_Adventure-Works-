with renamed as (

    select
        cast(SalesReasonID as int)      as id_motivo,
        cast(Name as varchar)           as nome_motivo,
        cast(ReasonType as varchar)     as tipo_motivo

    from {{ source('erp', 'SALES_SALESREASON') }}
)

select *
from renamed