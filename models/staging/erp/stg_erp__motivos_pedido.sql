with renamed as (

    select
        cast(SalesOrderID as int)       as id_pedido,
        cast(SalesReasonID as int)      as id_motivo

    from {{ source('erp', 'SALES_SALESORDERHEADERSALESREASON') }}
)

select *
from renamed