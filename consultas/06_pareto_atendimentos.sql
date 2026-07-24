-- Quais tipos de atendimento representam 80% do faturamento total?
with resul as (
    select a.tipo_atendimento,
            sum(a.valor) total
       from atendimentos a 
      group by a.tipo_atendimento
)      
select tipo_atendimento,
       total,
       round(sum(total) over(order by total desc) / sum(total) over() * 100, 1) percentual_acumulado
  from resul;
  
-- O tipo de atendimento que gerou mais receito no semestre foi Emergencia, sendo responsavel por 51,60% da receita geral.