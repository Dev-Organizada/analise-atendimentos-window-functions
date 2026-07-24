-- Divida os médicos em 4 grupos (quartis) por faturamento gerado — quem está no top 25%?
with resul as (
    select m.nome_medico,
          a.valor,
          ntile(4) over(order by a.valor desc) faixa
      from medicos m
      join atendimentos a on a.id_medico = m.id_medico
)
select * from resul where faixa = 1;

-- O Dr. João Pedro foi o medico com a maior faixa de faturamento do semestre