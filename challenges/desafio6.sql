SELECT
  CONVERT(IF(ROUND(MIN(P.valor), 2) = 0, '0.00', ROUND(MIN(P.valor), 2)), CHAR) AS faturamento_minimo,
  CONVERT(MAX(P.valor), CHAR) AS faturamento_maximo,
  CONVERT(ROUND(AVG(P.valor), 2), CHAR) AS faturamento_medio,
  CONVERT(ROUND(SUM(P.valor), 2), CHAR) AS faturamento_total
FROM plano AS P
INNER JOIN user AS U
ON U.plano_id = P.plano_id;