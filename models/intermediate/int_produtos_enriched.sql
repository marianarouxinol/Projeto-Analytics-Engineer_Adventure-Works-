with produto as (

    select
        id_produto,
        nome_produto,
        id_modelo,
        id_subcategoria
    from {{ ref('stg_erp__produtos') }}

),

subcategoria as (

    select
        id_subcategoria,
        nome_subcategoria,
        id_categoria
    from {{ ref('stg_erp__subcategorias') }}

),

categoria as (

    select
        id_categoria,
        nome_categoria
    from {{ ref('stg_erp__categorias') }}

),

joinado as (

    select
        p.id_produto,
        p.nome_produto,
        p.id_modelo,
        s.id_subcategoria,
        s.nome_subcategoria,
        c.id_categoria,
        c.nome_categoria
    from produto p
    left join subcategoria s on p.id_subcategoria = s.id_subcategoria
    left join categoria c on s.id_categoria = c.id_categoria

)

select *
from joinado