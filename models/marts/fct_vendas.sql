with pedidos as (
    select * from {{ ref('stg_erp__pedidos') }}
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
    p.id_pedido,
    p.status_pedido,
    cast(p.data_pedido as date)                     as data_pedido,
    dc.tipo_cartao,
    p.valor_bruto,
    p.valor_total,
    d.ano,
    d.mes,
    d.dia,
    cli.id_pessoa,
    cli.id_territorio,
    cli.linha1,
    cli.cidade,
    cli.nome_provincia,
    cli.nome_pais
from pedidos p
left join dim_data d
    on p.data_pedido = d.data_id
left join dim_cartao dc
    on p.id_cartao = dc.id_cartao
left join dim_cliente cli
    on p.id_cliente = cli.id_cliente
