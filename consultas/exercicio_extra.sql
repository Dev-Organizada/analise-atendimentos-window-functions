/*
Para cada especialidade médica, calcule o faturamento total por mês e o percentual de crescimento (ou queda) em relação ao mês anterior. 
Além disso, mostre qual percentual cada especialidade representa do faturamento total da clínica no semestre inteiro
*/
with resul as (
select to_char(trunc(a.data_atendimento, 'mm'),'mm/yy') mes_ano,
       a.tipo_atendimento especialidade,
       sum(a.valor) faturamento_mensal,
       round(((sum(a.valor) - lag(sum(a.valor)) over (
                    partition by a.tipo_atendimento
                    order by trunc(a.data_atendimento, 'mm'))
               )/ lag(sum(a.valor)) over (
                partition by a.tipo_atendimento
                order by trunc(a.data_atendimento, 'mm')))*100,1) porcentagem     
  from atendimentos a 
  group by trunc(a.data_atendimento, 'mm'),
       a.tipo_atendimento
)
select mes_ano,
       especialidade
       faturamento_mensal,
       case 
        when porcentagem is null then 'Primeiro mes registrado'
        when porcentagem = 0 then 'Não houve alteração'
        when porcentagem > 0 then 'Houve um crescimento de '||porcentagem||'%'
        when porcentagem < 0 then 'Houve uma queda de '||abs(porcentagem)||'%'
        end conclusão
  from resul 
  