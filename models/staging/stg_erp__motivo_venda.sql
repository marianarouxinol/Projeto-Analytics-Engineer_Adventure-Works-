select
    SalesReasonID  as id_motivo,
    Name           as motivo,
    ReasonType     as tipo_motivo
from {{ source('erp', 'SALES_SALESREASON') }}