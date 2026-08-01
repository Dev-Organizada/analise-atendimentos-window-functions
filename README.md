# Análise de Atendimentos Hospitalares com Window Functions

## Contexto

Simulação de uma rede de clínicas com 3 unidades em Fortaleza/CE. O objetivo do projeto foi responder perguntas reais de negócio — faturamento, ranking, sazonalidade, retenção por especialidade — usando **funções de janela (Window Functions)** em SQL (Oracle).

## Por que esse projeto

Tenho +5 anos de experiência como desenvolvedora PL/SQL em sistemas de saúde (Hapvida, Unimed BH, Banco do Brasil - previdência privada). Esse projeto une esse domínio de negócio real com as técnicas analíticas que venho aprofundando na minha transição de carreira para Engenharia de Dados / IA aplicada.

Sou certificada em **Scrum Fundamentals** e **Kanban Essentials**, e apliquei essas metodologias na organização do próprio desenvolvimento do projeto (ver seção "Como foi organizado", abaixo).

## Tecnologias

- **PostgreSQL / Oracle SQL Developer** — modelagem, consultas e window functions
- **Python (pandas, matplotlib)** — visualização de dados a partir dos resultados SQL
- **Google Colab** — execução do notebook de análise gráfica

## Estrutura do banco

3 tabelas relacionadas: `unidades` (unidade + cidade), `medicos` (nome + especialidade) e `atendimentos` (fato — data, tipo, valor, unidade, médico).

## Os 10 exercícios + 1 bônus

| # | Função | Pergunta de negócio |
|---|--------|----------------------|
| 1 | `RANK()` / `DENSE_RANK()` | Qual unidade teve maior faturamento em cada mês (com empates)? |
| 2 | `ROW_NUMBER()` | Qual o 2º atendimento mais caro de cada unidade? |
| 3 | `AVG()` (janela móvel) | Média móvel dos últimos 3 atendimentos por unidade |
| 4 | `LAG()` | Faturamento cresceu ou caiu vs. mês anterior? |
| 5 | `SUM()` acumulado | Faturamento acumulado (running total) por unidade no semestre |
| 6 | % acumulado (Pareto) | Quais tipos de atendimento representam 80% do faturamento? |
| 7 | `NTILE()` | Médicos em quartis por faturamento gerado — quem está no top 25%? |
| 8 | `MAX()` / `MIN()` | Maior e menor valor de atendimento por especialidade |
| 9 | Contribuição % | % do faturamento total que cada unidade representa |
| 10 | `PARTITION BY` (síntese) | Query única com CTE combinando ranking + acumulado + % por cidade e especialidade |
| Bônus | `LAG()` + `TRUNC()` + % | Crescimento mensal e contribuição percentual por especialidade médica |

## Principais aprendizados técnicos

Esses foram os pontos que mais me exigiram entender o **porquê**, não só corrigir o erro:

- **`TO_CHAR` vs. `TRUNC` para agrupar por mês:** ordenar/agrupar por `TO_CHAR(data, 'mm/yy')` parece funcionar, mas é ordenação de **texto** — quebra silenciosamente assim que os dados cruzam mais de um ano (ex: "01/27" viria antes de "12/26" alfabeticamente). A correção é agrupar e ordenar por `TRUNC(data, 'MM')` (data de verdade) e usar `TO_CHAR` só na exibição final.
- **Granularidade antes da window function:** no exercício de quartis (`NTILE`), aplicar a função direto sobre os atendimentos individuais dá um resultado totalmente diferente de aplicá-la sobre o faturamento **já agregado por médico**. A regra: agregar primeiro (`GROUP BY`), depois particionar/ranquear.
- **Frame implícito em `MAX()`/`MIN()` com `ORDER BY`:** usar `ORDER BY` dentro do `OVER()` de um `MAX`/`MIN` sem especificar o frame ativa um cálculo *acumulado até a linha atual* (não o máximo/mínimo do grupo inteiro) — um resultado que pode "parecer certo" por coincidência da direção da ordenação, mas quebra se a ordem mudar.
- **Reprodutibilidade em `ORDER BY` de window functions:** sempre pensar em critério de desempate (ex: `ROW_NUMBER()` sem um segundo critério de ordenação pode devolver posições diferentes em execuções diferentes, quando há empate no critério principal).

## Destaque: exercício de síntese (#10)

Uma única CTE combinando `RANK()` (posição da especialidade por cidade/mês), `SUM() OVER` (faturamento acumulado) e contribuição percentual — particionando por cidade e especialidade ao mesmo tempo.

**Principais conclusões da análise:**
- Cardiologia foi a especialidade que mais faturou em todos os meses do semestre, com queda a partir de março.
- Em março, Cardiologia representou 80,9% do faturamento mensal — a maior concentração do semestre — enquanto Ortopedia representou apenas 9%, a menor participação registrada.
- Clínico Geral apresentou queda constante ao longo do semestre, sem nenhum atendimento registrado em abril.
- Março foi o mês de maior faturamento total do semestre (R$ 1.990), e abril o de menor faturamento acumulado (R$ 1.130).

## Como foi organizado

Projeto dividido em sprints (metodologia ágil aplicada ao próprio aprendizado):
- **Sprint 1:** exercícios 1 a 3
- **Sprint 2:** exercícios 4 a 7 + exercício bônus de reforço (percentual + TRUNC)
- **Sprint 3:** exercícios 8 a 10, visualização em Python e fechamento do projeto

Cada sprint incluiu commit no GitHub e post de progresso no LinkedIn, documentando o aprendizado, não só o resultado.

## Como rodar

1. Rode `script_criacao_tabelas.sql`
2. Rode `dados_exemplo.sql`
3. Execute as queries da pasta `/consultas`, na ordem
4. Para a visualização gráfica, abra `/analises/grafico_pareto.ipynb` no Google Colab e importe o CSV exportado da consulta correspondente

## Estrutura do repositório

```
analise-atendimentos-window-functions/
├── README.md
├── script_criacao_tabelas.sql
├── dados_exemplo.sql
├── consultas/
│   ├── 01_ranking_unidades.sql
│   ├── 02_segundo_maior_valor.sql
│   ├── 03_media_movel.sql
│   ├── 04_comparativo_mensal_lag.sql
│   ├── 05_faturamento_acumulado.sql
│   ├── 06_pareto_atendimentos.sql
│   ├── 07_quartis_medicos_ntile.sql
│   ├── 08_max_min_especialidade.sql
│   ├── 09_contribuicao_percentual.sql
│   ├── 10_analise_combinada.sql
│   └── extra_percentual_crescimento_especialidade.sql
├── analises/
│   └── grafico_pareto.ipynb
└── prints/
    └── grafico_pareto.png
```

## Próximos passos

Este projeto é o primeiro de dois no meu portfólio de transição para Engenharia de Dados. O segundo, **Pipeline de Retenção e Eficiência em Rede de Clínicas**, amplia esse mesmo domínio de negócio para um pipeline completo (API pública → ingestão → transformação → modelagem → dashboard).

---

**Nathaly Rodrigues** — Analista de Sistemas | Oracle PL/SQL | Transição para Engenharia de Dados e IA Aplicada
[LinkedIn](https://linkedin.com/in/nathalyrodrigues) · [GitHub](https://github.com/Dev-Organizada)
