-- Qual o faturamento acumulado (running total) de cada unidade ao longo do semestre?
with resul as ( 
    select u.nome_unidade,
           to_char(trunc(a.data_atendimento, 'MM'),'mm/yy') mes_ano,
           sum(a.valor) total
      from atendimentos a 
      join unidades u on u.id_unidade = a.id_unidade
      group by u.nome_unidade, trunc(a.data_atendimento, 'MM')
      order by u.nome_unidade, trunc(a.data_atendimento, 'MM')
)
select nome_unidade,
       mes_ano,
       total,
       sum(total) over (
        partition by nome_unidade
        order by mes_ano 
       ) acumulado
 from resul;
 
-- A unidade Sul foi a unidade com maior faturamento acumulado durante o semestre, com um faturamento total de R$4650