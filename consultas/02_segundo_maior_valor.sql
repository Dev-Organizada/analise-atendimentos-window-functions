--Qual foi o 2º atendimento mais caro de cada unidade?
with resul as (
    select u.nome_unidade,
           a.valor,
           row_number() over(
            partition by u.nome_unidade
            order by a.valor desc
            ) posicao
      from atendimentos a
      join unidades u on u.id_unidade = a.id_unidade
      )
select nome_unidade,
       valor
  from resul
 where posicao = 2;