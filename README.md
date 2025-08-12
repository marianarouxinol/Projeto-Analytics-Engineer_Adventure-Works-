# 📊 Projeto: Analytics Engineer — Adventure Works

## 🎯 Objetivo

Este projeto simula a arquitetura de dados da empresa fictícia **Adventure Works**, com foco na aplicação de boas práticas de engenharia analítica usando **dbt (Data Build Tool)**. O principal objetivo é a modelagem dimensional, construção de pipelines ELT e validação automatizada dos dados.  O objetivo principal é transformar dados brutos em insights confiáveis para suporte à tomada de decisão.

## 🛠️ Ferramentas Utilizadas

| Ferramenta           | Finalidade                                               |
|----------------------|----------------------------------------------------------|
| **dbt**              | Modelagem de dados, testes automatizados, documentação   |
| **Power BI**         | Visualização interativa dos dados e KPIs                 |
| **Snowflake**  | Armazenamento e consulta dos dados                       |
| **GitHub**           | Versionamento e entrega do projeto                       |
| **Google Drive / YouTube** | Hospedagem do vídeo de apresentação              |



🧠 Modelo Dimensional
O projeto segue uma modelagem estrela, com uma tabela fato central e múltiplas dimensões relacionadas. Essa estrutura facilita análises rápidas e escaláveis.
📌 Figura 1: Representação visual do modelo dimensional utilizado no projeto
(inserir imagem do modelo conceitual aqui)

🗂️ Tabelas Utilizadas
🧾 Tabela Fato: fato_pedidos
Contém os principais dados transacionais de vendas:
- id_pedido, id_produto, nome_produto, nome_subcategoria, nome_categoria
- status_pedido, data_pedido, tipo_cartao, motivoid, motivo_nome, tipo_motivo
- valor_bruto, valor_liquido, quantidade_comprada
- ano, mes, dia
- id_pessoa, id_territorio, linha1, cidade, nome_provincia, nome_pais

🧱 Tabelas Dimensão
| Tabela | Chave Primária | Principais Campos | 
| dim_cliente | customerid | nome_cliente, tipo_pessoa | 
| dim_produto | productid | nome_produto, categoria_produto, linha_produto | 
| dim_vendedor | salespersonid | nome_vendedor, territorio | 
| dim_cartao | cartao_id | tipo_cartao, emissor_cartao | 
| dim_data | data_id | dia, mês, ano, trimestre, semana, feriado, fim_de_semana | 
| dim_localidade | localidade_id | cidade, estado, país | 
| dim_motivo_venda | motivoid | motivo_nome, tipo_motivo | 



🧪 Testes Automatizados com dbt
Para garantir a confiabilidade dos dados, aplicamos os seguintes testes:
- 🔹 unique nas chaves primárias das dimensões
- 🔹 not_null nos campos obrigatórios
- 🔹 relationships entre tabelas fato e dimensões
- 🔹 Teste de veracidade solicitado pelo CEO Carlos:
Verificamos que o faturamento bruto do ano de 2011 foi exatamente $12.646.112,16, conforme esperado. Esse teste foi implementado diretamente no dbt como uma validação de agregação.

📈 Painel de BI
O dashboard interativo foi desenvolvido no Power BI, com filtros dinâmicos e visualizações que respondem às perguntas estratégicas:
- Evolução de vendas por mês e país
- Ticket médio por produto, cliente e região
- Top 10 clientes e Top 5 cidades
- Produto mais comprado com motivo “Promotion”

Se quiser, posso te ajudar a montar o arquivo README.md com formatação para o GitHub, incluindo links e imagens. Quer que eu gere esse arquivo para você?


---

## 🧠 Modelo Dimensional

O projeto segue uma modelagem estrela com uma tabela fato central e múltiplas dimensões relacionadas.

<img width="770" height="823" alt="modelo_conceitual" src="https://github.com/user-attachments/assets/fd14d1c1-2049-4a02-a7f5-dd5974464589" />

<p align="center"><em>Figura 1: Representação visual do modelo dimensional utilizado no projeto.</em></p>
---

## 🗂️ Tabelas Utilizadas

### 🧾 Tabela Fato

- id_pedido
- id_produto
- nome_produto
- nome_subcategoria
- nome_categoria
- status_pedido
- data_pedido
- tipo_cartao
- motivoid
- motivo_nome
- tipo_motivo
- valor_bruto
- valor_liquido
- quantidade_comprada
- ano
- mes
- dia
- id_pessoa
- id_territorio
- linha1
- cidade
- nome_provincia
- nome_pais






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
- 🔹 **Teste de veracidade solicitado pelo CEO Carlos**:  
  Verificamos que o **faturamento bruto do ano de 2011** foi exatamente **$12.646.112,16**, conforme esperado. Esse teste foi implementado diretamente no dbt como uma validação de agregação.


## 📈 Painel de BI

O dashboard interativo foi desenvolvido no **Power BI** e responde às principais perguntas estratégicas do projeto. Abaixo estão os principais elementos e insights extraídos:

### 🔹 Indicadores Gerais

- **Total de Pedidos**: 2.000  
- **Quantidade Comprada**: 13.650  
- **Valor Negociado**: R$ 15,38 milhões  
- **Ticket Médio**: R$ 0,68  

### 📊 Evolução Temporal

- **Valor Negociado por Mês**:
  - Destaques:  
    - **Julho**: R$ 2,4 Mi  
    - **Agosto**: R$ 2,9 Mi  
    - **Outubro**: R$ 3,0 Mi  

- **Ticket Médio por Mês e Número de Pedidos**:
  - **Dezembro** teve o maior ticket médio: R$ 0,39 com 123 pedidos  
  - **Julho** também se destacou com R$ 0,37 e 138 pedidos  

### 🥇 Produtos em Destaque

- **Top 10 em Quantidade Comprada**:
  - `Mountain Bike`: 608 unidades  
  - `Awc Logo Cap`: 545 unidades  
  - `Long-Sleeve Jersey`: 544 unidades  

- **Top 10 em Valor Negociado**:
  - `Road-150 Red`: R$ 1,595 Mi  
  - `Road-450 Red`: R$ 1,363 Mi  
  - `Road-650 Black`: R$ 0,179 Mi  

### 🌍 Análise Geográfica

- **Pedidos por Região**:
  - Presença global com destaque para:
    - América do Norte
    - Europa
    - América do Sul

- **Faturamento por Cidade**:
  - **London**: R$ 136,4 mil  
  - **Paris**: R$ 120,2 mil  
  - **Chula Vista**: R$ 114,8 mil  



