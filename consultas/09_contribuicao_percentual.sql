-- Que % do faturamento total cada unidade representa?

select u.nome_unidade,
       sum(a.valor) faturamento_unidade,
       sum(sum(a.valor)) over () faturamento_geral,
       round(sum(a.valor)/sum(sum(a.valor)) over () * 100,1) percentual_faturamento
  from atendimentos a
  join unidades u on u.id_unidade = a.id_unidade
 group by u.nome_unidade;
 
-- Unidade Sul representa 51,6% do faturamento geral