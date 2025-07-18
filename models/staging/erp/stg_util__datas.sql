with datas as (

    select
    dateadd(day, row_number() over (order by seq4()) - 1, '2015-01-01') as data_id
from table(generator(rowcount => 4000))

),

final as (

    select
        data_id,
        extract(year from data_id)        as ano,
        extract(month from data_id)       as mes,
        extract(day from data_id)         as dia,
        extract(quarter from data_id)     as trimestre,
        dayname(data_id)                  as dia_semana,
        case
            when dayofweek(data_id) in (6,7) then true
            else false
        end                               as fim_de_semana
    from datas

)

select *
from final