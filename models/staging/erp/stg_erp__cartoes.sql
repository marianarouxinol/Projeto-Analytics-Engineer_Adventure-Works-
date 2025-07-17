with renamed as (

    select
        cast(CreditCardID as int)       as id_cartao,
        cast(CardType as varchar)       as tipo_cartao,
        cast(CardNumber as varchar)     as numero_cartao,
        cast(ExpMonth as int)           as mes_validade,
        cast(ExpYear as int)            as ano_validade

    from {{ source('erp', 'SALES_CREDITCARD') }}
)

select *
from renamed