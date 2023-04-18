SELECT 
	usuario.nome AS pessoa_usuaria,
    COUNT(historico.date) AS musicas_ouvidas,
    ROUND(SUM(musica.duracao)/ 60, 2) AS total_minutos
FROM user AS usuario
INNER JOIN reproduzido AS historico
ON usuario.user_id = historico.user_id
INNER JOIN musica AS musica
ON musica.musica_id = historico.musica_id
GROUP BY usuario.nome
ORDER BY usuario.nome;