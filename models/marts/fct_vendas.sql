with vendas_detalhadas as (
    select
        sd.SalesOrderID                     as id_pedido,
        cast(h.OrderDate as date)          as data_pedido,
        extract(year from h.OrderDate)     as ano,
        h.Status                            as status_pedido,
        sd.ProductID,
        sd.SpecialOfferID,
        sd.OrderQty,  -- ✅ quantidade comprada
        cast(sd.UnitPrice as numeric(20,4)) as unit_price,
        cast(sd.UnitPrice as numeric(20,4)) * sd.OrderQty as valor_bruto,
        cast(sd.UnitPrice as numeric(20,4)) * sd.OrderQty * (1 - sd.UnitPriceDiscount) as valor_liquido,
        h.CustomerID                        as id_cliente,
        h.CreditCardID                      as id_cartao
    from RAW_ADVENTURE_WORKS.SALES_SALESORDERDETAIL sd
    join RAW_ADVENTURE_WORKS.SALES_SALESORDERHEADER h
      on sd.SalesOrderID = h.SalesOrderID
    where extract(year from h.OrderDate) = 2011
),

dim_cliente as (
    select * from FEA25_05.dbt_mrouxinol_int.int_clientes__enriched
),

dim_cartao as (
    select * from FEA25_05.dbt_mrouxinol_marts.dim_cartao
),

dim_data as (
    select * from FEA25_05.dbt_mrouxinol_marts.dim_data
)

select
    v.id_pedido,
    v.ProductID,
    v.status_pedido,
    v.data_pedido,
    dc.tipo_cartao,
    round(sum(v.valor_bruto), 2) as valor_bruto,
    round(sum(v.valor_liquido), 2) as valor_liquido,
    sum(v.OrderQty) as quantidade_comprada,  -- ✅ nova métrica agregada
    d.ano,
    d.mes,
    d.dia,
    cli.id_pessoa,
    cli.id_territorio,
    cli.linha1,
    cli.cidade,
    cli.nome_provincia,
    cli.nome_pais
from vendas_detalhadas v
join dim_cartao dc
  on v.id_cartao = dc.id_cartao
join dim_data d
  on v.data_pedido = d.data_id
join dim_cliente cli
  on v.id_cliente = cli.id_cliente
group by
    v.id_pedido,
    v.ProductID,
    v.status_pedido,
    v.data_pedido,
    dc.tipo_cartao,
    d.ano,
    d.mes,
    d.dia,
    cli.id_pessoa,
    cli.id_territorio,
    cli.linha1,
    cli.cidade,
    cli.nome_provincia,
    cli.nome_pais