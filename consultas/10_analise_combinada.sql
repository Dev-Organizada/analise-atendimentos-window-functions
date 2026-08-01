/*
1. Use uma CTE (WITH) para calcular o faturamento agregado por cidade + especialidade + mês.
2. Na query externa, combine pelo menos: um RANK()/DENSE_RANK() (ex: ranking de especialidade por faturamento dentro de cada cidade) + uma média móvel ou SUM() acumulado + uma contribuição percentual.
*/
with resul as (
    select to_char(trunc(a.data_atendimento, 'mm'), 'mm/yy') mes_ano,
           u.cidade,
           m.especialidade,
           sum(a.valor) faturamento
      from atendimentos a
      join unidades u on u.id_unidade = a.id_unidade
      join medicos m on m.id_medico = a.id_medico
      group by trunc(a.data_atendimento, 'mm'),
           u.cidade,
           m.especialidade
      order by 1
)
select mes_ano,
       cidade,
       especialidade,
       faturamento,
       rank() over ( 
        partition by mes_ano, cidade
        order by faturamento desc
       ) posicao_especialidade,
       round(faturamento/ sum(faturamento) over (partition by mes_ano) * 100, 1) percentual_faturamento_mensal, -- quantos % cada especialidade representa no faturamento total mensal
       sum(faturamento) over (partition by mes_ano, cidade order by faturamento desc) faturamento_acumulado_mensal
  from resul;
  
/* Analises
- Cardiologia foi a especialidade que mais faturou em todos os meses do semestre, porem, a partir de Março houve uma queda nesse faturamento
- No mês de Março, a especialidade Cardiologia representou 80,9% do faturamento mensal e nesse mesmo mes, a especialidade Ortopedia representou apenas 9% do faturamento, 
foi a porcentagem mais baixa de todo semestre
- A especialidade Clínico Geral houve queda durante todo o semestre e em Abril não foi registrado nenhum atendimento para essa especialidade.
- Mês de Março foi o mes com maior faturamento do semestre, com um total de R$1.990 e Abril foi o mes com o menor faturamento acumulado do semestre, fechando em R$1.130
*/

  
