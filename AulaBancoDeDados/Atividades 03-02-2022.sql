USE ERP;

-- Listagem dos Clientes e quantidade de compras
SELECT u.id, u.nome, SUM(u.pmCount + u.pcCount)
FROM (
	SELECT l.id, f.nome, COUNT(pm.Logista) AS 'pmCount', 'pcCount'
    FROM funcionarios f
		JOIN logistas l ON l.Funcionario = f.id
        JOIN pedidosmanutencoes pm ON pm.Logista = l.id
	GROUP BY l.id
    
    UNION
    
    SELECT l.id, f.nome, 'pmCount', COUNT(pc.Logista) AS 'pcCount'
    FROM funcionarios f
		JOIN logistas l ON l.Funcionario = f.id
        JOIN pedidoscompras pc ON pc.Logista = l.id
	GROUP BY l.id) AS u
GROUP BY u.id, u.nome
ORDER BY SUM(u.pmCount + u.pcCount) DESC
LIMIT 1;


-- Crie uma VIEW que retorne o vendedor que mais realizou atendimentos a clientes de manute~ção e valor total
CREATE OR REPLACE VIEW vendedor_que_mais_atendeu AS
	SELECT 
-- Listagem do gerente de cada departamento 
-- Crie uma procedeure que me permita realizar um filtro de nome no estoquista que atendeu mais solicitações
-- Qual foi o produto mais solicitado a estoquistas e sua quantidade
-- Tecnico que solicitou mais produtos
-- Tecnicos que atenderam mais ordem de serviços
-- Tempo médio gasto dos tecnicos durante as ordens de serviço
-- Mês que teve maior ocorrencia de solicitações de suporte online
-- Atendente que realizou o maior número de atendimentos
SELECT l.id, f.nome, count(pm.Logista) AS 'pmCount', 'pcCount'
FROM funcionarios f 
	JOIN logistas l ON l.Funcionario = f.id
    JOIN pedidosmanutencoes om on om.Logista = l.id
GROUP BY l.id

UNION

SELECT l.id, f.nome, 'pmCount' count(pm.Logista) AS 'pcCount'
FROM funcionarios f 
	JOIN logistas l ON l.Funcionario = f.id
    JOIN pedidoscompras pc ON pc.Logista = l.id
GROUP BY l.id;
-- Listagem dos tipos de suporte online e total de ocorrência 