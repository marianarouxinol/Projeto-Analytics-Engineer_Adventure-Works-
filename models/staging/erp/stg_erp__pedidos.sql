with renamed as (

    select
        cast(SalesOrderID as int)       as id_pedido,
        cast(CustomerID as int)         as id_cliente,
        cast(OrderDate as date)         as data_pedido,
        cast(CreditCardID as int)       as id_cartao,         
        cast(SubTotal as numeric)       as valor_bruto,
        cast(TotalDue as numeric)       as valor_total,
        cast(Status as int)             as status_pedido

    from {{ source('erp', 'SALES_SALESORDERHEADER') }}
)

select * from renamed