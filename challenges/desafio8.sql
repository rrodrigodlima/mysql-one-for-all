SELECT
  A.nome AS artista,
  B.nome AS album
FROM artista AS A
INNER JOIN album AS B
ON A.artista_id = B.artista_id
WHERE A.nome LIKE 'Elis%'
ORDER BY B.nome ASC;