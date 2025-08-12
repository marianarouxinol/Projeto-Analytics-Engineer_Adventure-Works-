with vendas_detalhadas as (
    select
        sd.SalesOrderID                       as id_pedido,
        cast(h.OrderDate as date)             as data_pedido,
        extract(year from h.OrderDate)        as ano,
        h.Status                               as status_pedido,
        sd.ProductID                           as id_produto_raw,
        sd.SpecialOfferID,
        sd.OrderQty,
        cast(sd.UnitPrice as numeric(20,4))    as unit_price,
        cast(sd.UnitPrice as numeric(20,4)) * sd.OrderQty                                         as valor_bruto,
        cast(sd.UnitPrice as numeric(20,4)) * sd.OrderQty * (1 - sd.UnitPriceDiscount)            as valor_liquido,
        h.CustomerID                           as id_cliente,
        h.CreditCardID                         as id_cartao,
        mv.SalesReasonID                       as motivoid,
        mv.motivo_nome,
        mv.tipo_motivo
    from RAW_ADVENTURE_WORKS.SALES_SALESORDERDETAIL sd
    join RAW_ADVENTURE_WORKS.SALES_SALESORDERHEADER h
      on sd.SalesOrderID = h.SalesOrderID
    left join FEA25_05.dbt_mrouxinol_int.int_motivo_venda mv
      on sd.SalesOrderID = mv.SalesOrderID
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
),

dim_produto as (
    select
        id_produto,
        nome_produto,
        id_modelo,
        id_subcategoria,
        nome_subcategoria,
        id_categoria,
        nome_categoria
    from FEA25_05.dbt_mrouxinol_marts.dim_produto
)

select
    v.id_pedido,
    cast(v.id_produto_raw as int)     as id_produto,
    p.nome_produto,
    p.nome_subcategoria,
    p.nome_categoria,
    v.status_pedido,
    v.data_pedido,
    dc.tipo_cartao,
    v.motivoid,
    v.motivo_nome,
    v.tipo_motivo,
    round(sum(v.valor_bruto), 2)       as valor_bruto,
    round(sum(v.valor_liquido), 2)     as valor_liquido,
    sum(v.OrderQty)                    as quantidade_comprada,
    d.ano,
    d.mes,
    d.dia,
    cli.id_pessoa,
    cli.id_territorio,
    cli.endereco,
    cli.cidade,
    cli.nome_provincia,
    cli.nome_pais
from vendas_detalhadas v
join dim_cartao  dc on v.id_cartao    = dc.id_cartao
join dim_data    d  on v.data_pedido  = d.data_id
join dim_cliente cli on v.id_cliente  = cli.id_cliente
left join dim_produto p on cast(v.id_produto_raw as int) = p.id_produto
group by
    v.id_pedido,
    cast(v.id_produto_raw as int),
    p.nome_produto,
    p.nome_subcategoria,
    p.nome_categoria,
    v.status_pedido,
    v.data_pedido,
    dc.tipo_cartao,
    v.motivoid,
    v.motivo_nome,
    v.tipo_motivo,
    d.ano,
    d.mes,
    d.dia,
    cli.id_pessoa,
    cli.id_territorio,
    cli.endereco,
    cli.cidade,
    cli.nome_provincia,
    cli.nome_pais