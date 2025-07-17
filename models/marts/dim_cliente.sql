with
    int_clientes as (
        select *
        from {{ ref('int_clientes__enriched') }}
    )

select *
from int_clientes