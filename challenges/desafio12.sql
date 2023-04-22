SELECT A.nome AS artista,
  CASE
	WHEN COUNT(F.musica_id) >= 5 THEN 'A'
  WHEN COUNT(F.musica_id) BETWEEN 3 AND 4 THEN 'B'
  WHEN COUNT(F.musica_id) BETWEEN 1 AND 2 THEN 'C'
  ELSE '-'
	END AS ranking
FROM artista AS A
INNER JOIN album AS CD
ON A.artista_id = CD.artista_id
INNER JOIN musica AS M
ON CD.album_id = M.album_id
LEFT JOIN musicas_favoritas AS F
ON M.musica_id = F.musica_id
GROUP BY A.nome
ORDER BY COUNT(F.musica_id) DESC, A.nome;