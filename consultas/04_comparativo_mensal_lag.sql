-- Comparando mês a mês, o faturamento da unidade cresceu ou caiu em relação ao mês anterior?
with resul as (
    select to_char(a.data_atendimento, 'mm/yy') mes_ano,
           u.nome_unidade,
           sum(a.valor) valor_total,
           lag(sum(a.valor)) over(
            partition by u.nome_unidade
            order by to_char(a.data_atendimento, 'mm/yy'), 
                     sum(a.valor)
           ) comparativo
      from atendimentos a
      join unidades u on u.id_unidade = a.id_unidade
      group by to_char(a.data_atendimento, 'mm/yy'),
                u.nome_unidade
)
select mes_ano,
       nome_unidade,
       valor_total mes_atual,
       comparativo mes_anterior,
       case 
        when comparativo is null then 'Primeiro mês registrado, sem mês anterior para comparação'
        when (valor_total - comparativo) > 0 then 'Houve um crescimento de '|| round(((valor_total - comparativo)/comparativo)*100,1)||'%'
        when (valor_total - comparativo) < 0 then 'Houve uma queda de '|| round(((valor_total - comparativo)/comparativo)*100,1)||'%'
        else 'Não houve diferença entre os meses'
        end conclusao
  from resul;
       