# 📊 Projeto: Analytics Engineer — Adventure Works

## 🎯 Objetivo

Este projeto simula a arquitetura de dados da empresa fictícia **Adventure Works**, com foco na aplicação de boas práticas de engenharia analítica usando **dbt (Data Build Tool)**. O principal objetivo é a modelagem dimensional, construção de pipelines ELT e validação automatizada dos dados.

---

## 🧠 Modelo Dimensional

O projeto segue uma modelagem estrela com uma tabela fato central e múltiplas dimensões relacionadas.

<img width="770" height="823" alt="modelo_conceitual" src="https://github.com/user-attachments/assets/fd14d1c1-2049-4a02-a7f5-dd5974464589" />

<p align="center"><em>Figura 1: Representação visual do modelo dimensional utilizado no projeto.</em></p>
---

## 🗂️ Tabelas Utilizadas

### 🧾 Tabela Fato

- id_pedido: Identificador único do pedido
- id_produto: Identificador do produto vendido
- nome_produto: Nome do produto
- nome_subcategoria: Subcategoria do produto
- nome_categoria: Categoria do produto
- status_pedido: Status do pedido
- data_pedido: Data em que o pedido foi realizado
- tipo_cartao: Tipo de cartão utilizado na compra
- motivoid: Identificador do motivo da venda
- motivo_nome: Nome do motivo da venda (ex: promoção, recomendação)
- tipo_motivo: Tipo do motivo da venda (ex: marketing, relacionamento)
- valor_bruto: Valor total da venda antes de descontos
- valor_liquido: Valor total da venda após descontos
- quantidade_comprada: Quantidade de unidades compradas
- ano: Ano da data do pedido
- mes: Mês da data do pedido
- dia: Dia da data do pedido
- id_pessoa: Identificador da pessoa que realizou o pedido
- id_territorio: Identificador do território de vendas
- linha1: Endereço do cliente (linha 1)
- cidade: Cidade do cliente
- nome_provincia: Estado ou província do cliente
- nome_pais: País do cliente



### 🧱 Dimensões

| Tabela              | Chave Primária      | Principais Campos                 |
|---------------------|---------------------|-----------------------------------|
| `dim_cliente`       | `customerid`        | nome_cliente, tipo_pessoa         |
| `dim_produto`       | `productid`         | nome_produto, categoria_produto, linha_produto |
| `dim_vendedor`      | `salespersonid`     | nome_vendedor, territorio         |
| `dim_cartao`        | `cartao_id`         | tipo_cartao, emissor_cartao       |
| `dim_data`          | `data_id`           | dia, mês, ano, trimestre, semana, feriado, fim_de_semana |
| `dim_localidade`    | `localidade_id`     | cidade, estado, país              |
| `dim_motivo_venda`  | `motivoid`          | motivo_nome, tipo_motivo          |

---

## 🧪 Testes Automatizados

Testes aplicados via dbt para garantir confiabilidade:

- 🔹 `unique` nas PKs
- 🔹 `not_null` nos campos obrigatórios
- 🔹 `relationships` entre fatos e dimensões







