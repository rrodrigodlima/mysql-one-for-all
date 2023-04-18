SELECT 
	usuario.nome AS pessoa_usuaria,
	IF(MAX(YEAR(historico.date)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM user AS usuario
INNER JOIN reproduzido AS historico
ON usuario.user_id = historico.user_id
GROUP BY usuario.nome
ORDER BY usuario.nome;