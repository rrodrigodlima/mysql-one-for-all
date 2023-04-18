SELECT 
	musica.nome AS cancao,
	COUNT(historico.musica_id) AS reproducoes
FROM musica AS musica
INNER JOIN reproduzido AS historico
ON musica.musica_id = historico.musica_id
GROUP BY musica.nome
ORDER BY reproducoes DESC, musica.nome
LIMIT 2;