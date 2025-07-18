with vendedor as (

    select
        id_vendedor,
        id_territorio,
        valor_bonus,
        quota_vendas
    from {{ ref('stg_erp__vendedores') }}

),

territorio as (

    select
        id_territorio,
        nome_territorio,
        codigo_pais,
        grupo_comercial
    from {{ ref('stg_erp__territorios') }}

),

joinado as (

    select
        v.id_vendedor,
        v.valor_bonus,
        v.quota_vendas,
        t.id_territorio,
        t.nome_territorio,
        t.codigo_pais,
        t.grupo_comercial
    from vendedor v
    left join territorio t on v.id_territorio = t.id_territorio

)

select *
from joinado