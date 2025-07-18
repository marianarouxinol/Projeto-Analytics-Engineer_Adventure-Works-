with base as (

    select *
    from {{ ref('int_cartao_enriched') }}

),

final as (

    select
        id_cartao,
        tipo_cartao,
        mes_expiracao,
        ano_expiracao
    from base

)

select *
from final