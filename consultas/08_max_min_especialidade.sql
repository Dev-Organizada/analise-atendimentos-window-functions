-- Qual o maior e o menor valor de atendimento por especialidade médica?
select a.tipo_atendimento,
       a.valor,
       max(a.valor) over (partition by a.tipo_atendimento order by a.valor desc) maior_valor,
       min(a.valor) over (partition by a.tipo_atendimento order by a.valor) menor_valor
  from atendimentos a;
  