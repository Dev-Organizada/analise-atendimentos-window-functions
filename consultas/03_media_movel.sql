--Qual a média móvel de faturamento dos últimos 3 atendimentos de cada unidade?
select a.valor,
               a.data_atendimento,
               u.nome_unidade,
               avg(a.valor) over(
                partition by u.nome_unidade
                order by a.data_atendimento, a.id_atendimento rows between 2 preceding and current row
               ) media_movel
          from atendimentos a
          join unidades u on a.id_unidade = u.id_unidade
 order by u.nome_unidade, a.data_atendimento;
