with base as (

    select *
    from {{ ref('stg_util__datas') }}

),

final as (

    select
        data_id,
        ano,
        mes,
        dia,
        trimestre,
        dia_semana,
        fim_de_semana
    from base

)

select *
from final