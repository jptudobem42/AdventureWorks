# Projeto: Plataforma de Dados - Adventure Works

## **Visão Geral**
A **Adventure Works (AW)**, uma indústria de bicicletas em franco crescimento, decidiu investir na criação de uma **Plataforma de Dados** para se tornar uma empresa **data-driven**. O projeto visa transformar os dados transacionais da empresa em insights estratégicos que suportem decisões de negócio, começando pela área de **vendas (sales)**. 

Com mais de **500 produtos**, **20.000 clientes** e **31.000 pedidos**, o objetivo é consolidar informações em um **Data Warehouse** moderno e confiável. A prioridade inicial é atender às perguntas críticas de vendas, permitindo que a empresa identifique oportunidades de crescimento e tome decisões baseadas em dados.

---

## **Objetivos do Projeto**

1. **Centralizar e Limpar os Dados:**  
   Consolidar dados de diferentes tabelas transacionais do AdventureWorks, garantindo consistência, qualidade e facilidade de uso para análises.

2. **Facilitar Análises de Negócios:**  
   Fornecer um modelo que suporte a análise de métricas importantes, como receita, quantidade comprada, desempenho por produto e motivo de venda.

3. **Permitir Respostas para Perguntas-Chave:**  
   Criar tabelas e métricas que respondam às perguntas mais importantes para o negócio, como:
   - Qual o desempenho por produto, cliente, região e motivo de venda?
   - Quem são os melhores clientes?
   - Quais regiões ou cidades geram maior receita?

4. **Garantir a Qualidade dos Dados:**  
   Implementar testes robustos que validem a confiabilidade das informações, como garantir a receita bruta de **$12.646.112,16 em 2011**, conforme solicitado pelo CEO.

5. **Apoiar a Construção de Dashboards:**  
   Estruturar um modelo fácil de integrar ao Power BI para gerar relatórios dinâmicos e gráficos interativos que respondam a KPIs essenciais.

6. **Construir uma Base para Expansão:**  
   Criar uma infraestrutura escalável que possa integrar dados de outras áreas no futuro, como logística e produção.

---

## **Principais Perguntas que o Projeto Responde**

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

## **Riscos e Contingências**

### **Riscos Identificados**
1. **Resistência Interna:**  
   Parte da equipe, especialmente da diretoria comercial, não enxerga o valor imediato do projeto e questiona o investimento.  
2. **Dependência de Recursos:**  
   Gabriel Santos, responsável pelo acesso aos dados, tem agenda limitada, o que pode causar atrasos.  
3. **Qualidade dos Dados:**  
   A inconsistência ou falta de integridade nos dados pode comprometer a confiança nos resultados.  
4. **Orçamento e Prazos:**  
   A pressão por resultados rápidos pode dificultar a execução planejada.

### **Contingências**
- **Engajamento Interno:**  
   Realizar demonstrações de valor rápido com análises que beneficiem diretamente a área comercial.  
- **Automação:**  
   Minimizar dependências manuais com processos automatizados na ingestão e validação de dados.  
- **Planejamento por Fases:**  
   Dividir o projeto em entregas menores, com prazos e objetivos claros.  
- **Testes de Qualidade:**  
   Implementar validações automáticas para garantir a consistência e a confiabilidade das informações.

---

## **Estrutura do Projeto**

O projeto foi estruturado em três camadas principais:

1. **Camada de Staging:**  
   Processa e organiza os dados brutos vindos das tabelas transacionais. Realiza renomeações, padronizações e pequenas transformações.

2. **Camada Intermediária (Intermediate):**  
   Realiza transformações mais complexas, como agregações e cruzamentos entre tabelas.  
   Exemplo: `int_salesreason_agg`, que consolida os motivos de venda em formato binário.

3. **Camada de Marts:**  
   Modelo dimensional com tabelas fato e dimensões otimizadas para análises.  
   Exemplo: `fat_vendas`, que consolida informações de pedidos, produtos, clientes e motivos de venda.

---

## **Impacto Esperado**
- **Melhoria na Tomada de Decisão:**  
   Identificar os produtos, clientes e regiões mais valiosos para o negócio.  
- **Eficiência Operacional:**  
   Reduzir o esforço manual de preparação de dados e aumentar a agilidade nas análises.  
- **Base para Expansões Futuras:**  
   Um modelo escalável e adaptável para integrar dados de outras áreas, como logística e produção.  
- **Confiança nos Dados:**  
   Geração de insights confiáveis, que suportem decisões estratégicas da diretoria.

---

# **Conclusão**

O projeto da **Plataforma de Dados da Adventure Works** representa um passo decisivo na transformação da empresa em uma organização **data-driven**. Focando inicialmente na área de vendas, foi possível consolidar dados dispersos em um **Data Warehouse confiável**, permitindo análises estratégicas e suporte à tomada de decisões.

Apesar dos desafios, como resistência interna e preocupações com custos, o projeto mostrou o valor de dados estruturados ao entregar insights claros sobre desempenho de vendas, produtos e clientes. A estrutura criada é escalável, pronta para futuras integrações com outras áreas e capaz de sustentar o crescimento da empresa.

Com este marco, a Adventure Works fortalece sua posição no mercado, utilizando dados como diferencial estratégico para competir em um cenário cada vez mais desafiador. 🚴‍♂️
