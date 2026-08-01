-- Qual o maior e o menor valor de atendimento por especialidade médica?
select m.especialidade,
       max(a.valor) maior_valor,
       min(a.valor)  menor_valor
  from atendimentos a
  join medicos m on m.id_medico = a.id_medico
  group by m.especialidade;
  
  