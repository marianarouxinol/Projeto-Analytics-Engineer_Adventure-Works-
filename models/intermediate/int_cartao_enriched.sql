with base as (

    select *
    from {{ ref('stg_erp__cartao') }}

),

final as (

    select
        cast(id_cartao as int)                  as id_cartao,
        initcap(tipo_cartao)                   as tipo_cartao,
        lpad(cast(mes_expiracao as string), 2, '0') as mes_expiracao,
        cast(ano_expiracao as int)             as ano_expiracao
    from base

)

select *
from final