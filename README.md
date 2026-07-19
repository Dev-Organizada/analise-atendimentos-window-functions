# Análise de Atendimentos Hospitalares com Window Functions

## Contexto
Simulação de uma rede de clínicas com 3 unidades em Fortaleza. Objetivo:
responder perguntas de negócio (faturamento, ranking, sazonalidade)
usando funções de janela em SQL.

## Por que esse projeto
Tenho 5+ anos como desenvolvedora PL/SQL em sistemas de saúde
(Hapvida, Unimed BH). Esse projeto une esse domínio de negócio
com as técnicas analíticas que estou aprofundando na transição
para Engenharia de Dados.

## Tecnologias
Oracle SQL Developer

## Destaques
- Ranking de unidades por faturamento mensal (RANK/DENSE_RANK)
- Média móvel de atendimentos (AVG + janela)
- Análise de Pareto dos tipos de atendimento (80/20)
- Segmentação de médicos por performance (NTILE)

## Como rodar
1. Rode `script_criacao_tabelas.sql`
2. Rode `dados_exemplo.sql`
3. Execute as queries em `/consultas`
