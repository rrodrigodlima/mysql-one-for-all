SELECT
	A.nome AS artista,
  B.nome AS album,
  COUNT(S.user_id) AS pessoas_seguidoras
FROM artista AS A
INNER JOIN album AS B
ON A.artista_id = B.artista_id
INNER JOIN seguidores as S
ON A.artista_id = S.artista_id
GROUP BY A.nome, B.nome
ORDER BY pessoas_seguidoras DESC, artista, album;