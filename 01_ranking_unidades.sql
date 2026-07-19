-- Qual unidade teve maior faturamento em cada mês? Empates devem aparecer com o mesmo rank.
select nome_unidade,
      mes_ano,
      valor_mes
 from (
        select u.nome_unidade,
               to_char(a.data_atendimento, 'mm/yy') mes_ano,
              sum(a.valor) valor_mes,
              rank() over(
                partition by to_char(a.data_atendimento, 'mm/yy')
                order by sum(a.valor) desc
              ) rank_mes
          from atendimentos a
          join unidades u on a.id_unidade = u.id_unidade
         group by u.nome_unidade, to_char(a.data_atendimento, 'mm/yy')) res
where rank_mes = 1
order by mes_ano;
