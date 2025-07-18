with base as (

    select
        id_produto,
        nome_produto,
        id_modelo,
        id_subcategoria,
        nome_subcategoria,
        id_categoria,
        nome_categoria
    from {{ ref('int_produtos_enriched') }}

),

final as (

    select
        cast(id_produto as int)               as id_produto,
        initcap(nome_produto)                 as nome_produto,
        cast(id_modelo as int)                as id_modelo,
        cast(id_subcategoria as int)          as id_subcategoria,
        initcap(nome_subcategoria)            as nome_subcategoria,
        cast(id_categoria as int)             as id_categoria,
        initcap(nome_categoria)               as nome_categoria
    from base

)

select *
from final