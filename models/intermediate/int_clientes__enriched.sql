with

    clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
        where id_pessoa is not null
    ),

    enderecos as (
        select *
        from {{ ref('stg_erp__enderecos') }}
    ),

    provincias as (
        select *
        from {{ ref('stg_erp__provincia') }}
    ),

    paises as (
        select *
        from {{ ref('stg_erp__pais') }}
    ),

    joined as (
        select
            clientes.id_cliente,
            clientes.id_pessoa,
            clientes.id_loja,
            clientes.id_territorio,
            enderecos.endereco           as Endereco,
            enderecos.cidade,
            provincias.nome_provincia,
            paises.nome_pais
        from clientes
        left join enderecos
            on clientes.id_cliente = enderecos.id_endereco
        left join provincias
            on enderecos.id_provincia = provincias.id_provincia
        left join paises
            on provincias.codigo_pais = paises.codigo_pais
    ),

    deduplicado as (
        select *,
            row_number() over (partition by id_pessoa order by id_cliente) as rn
        from joined
    )

select *
from deduplicado
where rn = 1