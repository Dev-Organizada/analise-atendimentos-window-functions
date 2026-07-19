--Qual foi o 2º atendimento mais caro de cada unidade?
select tipo_atendimento,
       valor,
       nome_unidade
  from (
        select a.tipo_atendimento,
               a.valor,
               u.nome_unidade,
               row_number() over(
                partition by u.nome_unidade
                order by a.valor desc
               ) posicao
          from atendimentos a
          join unidades u on a.id_unidade = u.id_unidade) res
  where posicao = 2;