USE ERP;
-- INNER JOIN
-- Listagem de tecnicos que não possuem CNH
SELECT * FROM funcionarios WHERE id IN (SELECT Funcionario FROM tecnicos WHERE cnh IS NULL);
-- // --

SELECT t.id, f.nome, f.CPF, f.CTPS 
	FROM funcionarios f 
		join tecnicos t on t.Funcionario = f.id 
    WHERE t.cnh IS NULL;
    
-- Listar atendentes que já realizaram atendimento online a um cliente em novembro
SELECT * FROM funcionarios WHERE id IN (SELECT funcionario FROM atendentesonline WHERE id IN(
SELECT atendenteonline FROM suporteonline WHERE month(DATA) = 11));

SELECT DISTINCT ao.id, f.nome, f.CPF FROM funcionarios f
	JOIN atendentesonline ao ON ao.Funcionario = f.id
    JOIN suporteonline so ON AtendenteOnline = ao.id
 WHERE month(so.DATA) = 11;
 
 -- ================================================================================
 -- LEFT/RIGHT JOIN
 
 -- Listar clientes que realizaram uma solicitação de manutenção
SELECT * FROM cliente WHERE id IN (SELECT cliente FROM pedidosmanutencoes);

SELECT c.id, c.nome, c.cpf, pm.Descricao, pm.Valor 
FROM clientes c
	LEFT JOIN pedidosmanutencoes pm ON pm.Cliente = c.id;
    
SELECT c.id, c.nome, c.cpf, pm.Descricao, pm.Valor 
FROM pedidosmanutencoes pm
	RIGHT JOIN clientes c ON pm.Cliente = c.id;
-- ===============================================================================
-- FULL JOIN / UNION

SELECT c.id, c.nome, c.cpf, pm.Descricao, pm.Valor 
FROM clientes c
	LEFT JOIN pedidosmanutencoes pm ON pm.Cliente = c.id
UNION

SELECT c.id, c.nome, c.cpf, pm.Descricao, pm.Valor 
FROM pedidosmanutencoes pm
	RIGHT JOIN clientes c ON pm.Cliente = c.id;
-- ================================================================================
-- GROUP BY
-- AGRUPAR DADOS REPETIDOS
SELECT ao.id, f.nome, f.cpf, COUNT(ao.id) AS 'Quantidade de chamadas atendidas'
FROM funcionarios f
	JOIN atendentesonline ao ON ao.Funcionario = f.id
    JOIN suporteonline so ON so.AtendenteOnline = ao.id
GROUP BY ao.id, f.nome, f.cpf
ORDER BY COUNT(ao.id) DESC;

-- DESC decrecente
-- S/DESCE crescente

-- ================================================================================
-- HAVING 
-- Filtrar agregações
SELECT ao.id, f.nome, f.cpf, COUNT(ao.id) AS 'Quantidade de chamadas atendidas'
FROM funcionarios f
	JOIN atendentesonline ao ON ao.Funcionario = f.id
    JOIN suporteonline so ON so.AtendenteOnline = ao.id
GROUP BY ao.id, f.nome, f.cpf
HAVING COUNT(ao.id) > 3
ORDER BY COUNT(ao.id) DESC;


-- INSERT INTO NovaTabela(nome) SELECT Nome FROM clientes;

-- ALTER TABLE Clientes
-- ALTER Texto SET DEFAULT
-- Alterar valor de tabela