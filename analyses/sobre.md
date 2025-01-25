# Sobre o Projeto

## Resumo
Este projeto foi desenvolvido para modelar e organizar os dados transacionais do banco AdventureWorks em um Data Warehouse. O objetivo principal é consolidar informações de vendas, clientes, produtos, territórios e motivos de venda, utilizando uma abordagem dimensional, que facilita análises e a construção de dashboards interativos no Power BI. 

O projeto utiliza o **dbt (Data Build Tool)** para transformar dados e criar tabelas otimizadas para análises. Essas tabelas respondem a perguntas-chave de negócios e fornecem insights sobre desempenho de vendas, comportamento de clientes, distribuição regional e desempenho de produtos.

---

## Objetivos do Projeto

1. **Centralizar e Limpar os Dados**  
   Consolidar dados de diferentes tabelas transacionais do AdventureWorks, garantindo consistência, qualidade e facilidade de uso para análises.

2. **Facilitar Análises de Negócios**  
   Fornecer um modelo que suporte a análise de métricas importantes, como receita, quantidade comprada, desempenho por produto e motivo de venda.

3. **Permitir Respostas para Perguntas-Chave**
   Criar tabelas e métricas que respondam às perguntas mais importantes para o negócio, como:
   - Qual o desempenho por produto, cliente, região e motivo de venda?
   - Quem são os melhores clientes?
   - Quais regiões ou cidades geram maior receita?

4. **Apoiar a Construção de Dashboards**
   Estruturar um modelo fácil de integrar ao Power BI para gerar relatórios dinâmicos e gráficos interativos que respondam a KPIs essenciais.

---

## Principais Perguntas que o Projeto Responde

### **1. Desempenho Detalhado de Vendas**
- Qual o número de pedidos, quantidade comprada e valor total negociado, detalhado por:
  - Produto
  - Tipo de cartão
  - Motivo de venda
  - Data de venda
  - Cliente
  - Status
  - Cidade, estado e país?

### **2. Produtos com Maior Ticket Médio**
- Quais produtos possuem o maior ticket médio por:
  - Mês
  - Ano
  - Cidade, estado e país?  
  *(Cálculo do ticket médio: Receita bruta - descontos do produto / número de pedidos no período de análise.)*

### **3. Melhores Clientes**
- Quem são os 10 melhores clientes por valor total negociado, com filtros por:
  - Produto
  - Tipo de cartão
  - Motivo de venda
  - Data de venda
  - Status
  - Cidade, estado e país?

### **4. Cidades de Melhor Desempenho**
- Quais são as 5 melhores cidades em valor total negociado, detalhado por:
  - Produto
  - Tipo de cartão
  - Motivo de venda
  - Data de venda
  - Cliente
  - Status
  - Cidade, estado e país?

### **5. Análise Temporal de Vendas**
- Qual o número de pedidos, quantidade comprada e valor total negociado por:
  - Mês e ano  
  *(Exibido como gráficos de séries temporais.)*

### **6. Análise de Motivos de Venda**
- Qual produto tem a maior quantidade de unidades compradas para o motivo de venda "Promotion"?

---

## Estrutura do Projeto

O projeto foi estruturado em três camadas principais:

1. **Camada de Staging**  
   - Processa e organiza os dados brutos vindos das tabelas transacionais.
   - Realiza renomeações, padronizações e pequenas transformações.

2. **Camada Intermediária (Intermediate)**  
   - Realiza transformações mais complexas, como agregações e cruzamentos entre tabelas.
   - Exemplo: `int_salesreason_agg`, que consolida os motivos de venda em formato binário.

3. **Camada de Marts**  
   - Modelo dimensional com tabelas fato e dimensões otimizadas para análises.
   - Exemplo: `fat_vendas`, que consolida informações de pedidos, produtos, clientes e motivos de venda.

---

## Tecnologias Utilizadas

- **Banco de Dados:** Snowflake
- **Modelagem de Dados:** dbt (Data Build Tool)
- **Visualização de Dados:** Power BI
- **Fonte de Dados:** AdventureWorks (modelo transacional)

---

## Principais Métricas e KPIs Disponíveis

- **Métricas de Vendas:**
  - Número de pedidos e quantidade comprada.
  - Receita bruta e líquida (após descontos).
  - Ticket médio por produto, período e região.

- **Métricas Regionais:**
  - Receita por cidade, estado e país.
  - Desempenho de produtos e clientes por região.

- **Análises de Motivos de Venda:**
  - Impacto de promoções, preço, qualidade, e outros fatores no desempenho de vendas.

- **Métricas Temporais:**
  - Distribuição de vendas por mês e ano.
  - Séries temporais de pedidos e receita.

---

## Impacto Esperado

- **Melhor Tomada de Decisão:**
   - Identificar os produtos e clientes mais valiosos para o negócio.
   - Priorizar regiões ou motivos de venda que gerem maior receita.

- **Eficiência na Construção de Dashboards:**
   - Reduzir o esforço manual de preparação de dados.
   - Fornecer informações claras e confiáveis para relatórios dinâmicos.

- **Base para Expansões Futuras:**
   - Um modelo escalável e adaptável para novas métricas, produtos ou integrações com outros sistemas.

---
