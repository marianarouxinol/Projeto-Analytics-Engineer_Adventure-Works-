with endereco as (
    select * from {{ ref('stg_erp__enderecos') }}
),

provincia as (
    select * from {{ ref('stg_erp__provincia') }}
),

pais as (
    select * from {{ ref('stg_erp__pais') }}
),

joined as (
    select
        e.id_endereco,
        e.linha1             as linha1,
        e.cidade,
        p.nome_provincia,
        pa.nome_pais
    from endereco e
    left join provincia p
        on e.id_provincia = p.id_provincia
    left join pais pa
        on p.codigo_pais = pa.codigo_pais
)

select * from joined