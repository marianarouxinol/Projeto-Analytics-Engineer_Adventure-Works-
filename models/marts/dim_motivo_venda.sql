with base as (

    select *
    from {{ ref('int_motivo_venda_enriched') }}

),

final as (

    select
        id_motivo,
        motivo,
        tipo_motivo
    from base

)

select *
from final