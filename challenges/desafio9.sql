SELECT 
	COUNT(*) AS musicas_no_historico
FROM reproduzido AS H
INNER JOIN user AS U
ON H.user_id = U.user_id
WHERE U.nome = 'Barbara Liskov';