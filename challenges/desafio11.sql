SELECT
	A.nome AS album,
  COUNT(*) AS favoritadas
FROM album AS A
INNER JOIN musica AS M
ON A.album_id = M.album_id
INNER JOIN musicas_favoritas AS F
ON M.musica_id = F.musica_id
GROUP BY A.nome
ORDER BY favoritadas DESC
LIMIT 3;