-- tests/tst_vendas_2011.sql
-- Teste de validação contábil: total de vendas em 2011 conforme auditoria
-- Valor esperado: R$12.646.112,16


with total_2011 as (
  select round(sum(cast(UnitPrice as numeric(38,6)) * OrderQty), 2) as total
  from {{ source('erp', 'SALES_SALESORDERDETAIL') }} sd
  join {{ source('erp', 'SALES_SALESORDERHEADER') }} sh
    on sd.SalesOrderID = sh.SalesOrderID
  where year(sh.OrderDate) = 2011
)

select *
from total_2011
where total <> 12646112.16