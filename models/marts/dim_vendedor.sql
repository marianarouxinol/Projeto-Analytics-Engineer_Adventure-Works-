with base as (

    select
        id_vendedor,
        valor_bonus,
        quota_vendas,
        id_territorio,
        nome_territorio,
        codigo_pais,
        grupo_comercial
    from {{ ref('int_vendedores__enriched') }}

),

final as (

    select
        cast(id_vendedor as int)            as id_vendedor,
        cast(valor_bonus as float)          as valor_bonus,
        cast(quota_vendas as float)         as quota_vendas,
        cast(id_territorio as int)          as id_territorio,
        initcap(nome_territorio)            as nome_territorio,
        upper(codigo_pais)                  as codigo_pais,
        initcap(grupo_comercial)            as grupo_comercial
    from base

)

select *
from final