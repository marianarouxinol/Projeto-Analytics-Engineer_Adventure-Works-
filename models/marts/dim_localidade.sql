with base as (
    select * from {{ ref('int_localidade_enriched') }}
),

final as (
    select
        id_endereco,
        initcap(endereco)             as endereco,
        initcap(cidade)             as cidade,
        initcap(nome_provincia)     as estado,
        initcap(nome_pais)          as pais
    from base
)

select * from final