with vendas_detalhadas as (
    select
        sd.SalesOrderID                     as id_pedido,
        cast(h.OrderDate as date)          as data_pedido,
        extract(year from h.OrderDate)     as ano,
        sd.ProductID,
        sd.SpecialOfferID,
        sd.OrderQty,
        cast(sd.UnitPrice as numeric(20,4)) as unit_price,
        cast(sd.UnitPrice as numeric(20,4)) * sd.OrderQty as valor_bruto,
        cast(sd.UnitPrice as numeric(20,4)) * sd.OrderQty * (1 - sd.UnitPriceDiscount) as valor_liquido
    from RAW_ADVENTURE_WORKS.SALES_SALESORDERDETAIL sd
    join RAW_ADVENTURE_WORKS.SALES_SALESORDERHEADER h
      on sd.SalesOrderID = h.SalesOrderID
    where extract(year from h.OrderDate) = 2011
),

dim_cliente as (
    select * from {{ ref('int_clientes__enriched') }}
),

dim_cartao as (
    select * from {{ ref('dim_cartao') }}
),

dim_data as (
    select * from {{ ref('dim_data') }}
),

dim_localidade as (
    select * from {{ ref('dim_localidade') }}
)

select
    v.id_pedido,
    v.ProductID,  -- ← Adicionado aqui
    h.Status as status_pedido,
    v.data_pedido,
    dc.tipo_cartao,
    round(sum(v.valor_bruto), 2) as valor_bruto,
    round(sum(v.valor_liquido), 2) as valor_liquido,
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
...
group by
    v.id_pedido,
    v.ProductID,  -- ← Adicionado aqui também
    h.Status,
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