select
  soh.SalesOrderID,
  sr.SalesReasonID,
  sr.Name as motivo_nome,
  sr.ReasonType as tipo_motivo
from {{ source('erp', 'SALES_SALESORDERHEADERSALESREASON') }} soh
join {{ source('erp', 'SALES_SALESREASON') }} sr
  on soh.SalesReasonID = sr.SalesReasonID