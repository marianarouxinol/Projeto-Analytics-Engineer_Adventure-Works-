with base as (

    select *
    from {{ ref('int_datas_enriched') }}

),

final as (

    select
        cast(data_id as date)           as data_id,
        cast(ano as int)                as ano,
        cast(mes as int)                as mes,
        cast(dia as int)                as dia,
        cast(trimestre as int)         as trimestre,
        initcap(dia_semana)            as dia_semana,
        cast(fim_de_semana as boolean) as fim_de_semana
    from base

)

select *
from final