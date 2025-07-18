select
    CreditCardID        as id_cartao,
    CardType            as tipo_cartao,
    ExpMonth            as mes_expiracao,
    ExpYear             as ano_expiracao
from {{ source('erp', 'SALES_CREDITCARD') }}