with base as (

    select *
    from {{ ref('stg_erp__motivo_venda') }}

),

final as (

    select
        cast(id_motivo as int)       as id_motivo,
        initcap(motivo)             as motivo,
        upper(tipo_motivo)          as tipo_motivo
    from base

)

select *
from final