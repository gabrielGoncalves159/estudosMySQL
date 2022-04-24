USE erp;

-- Vendedor que mais realizou atendimentos a clientes de pedidos de compras e valor total
-- tentativa
SELECT ao.id, f.nome, f.cpf, pc.Valor, COUNT(ao.id)
FROM Funcionarios f 
	JOIN atendentesonline ao ON ao.Funcionario = f.id
    JOIN pedidoscompras pc ON pc.AtendenteOnline = ao.Id
GROUP BY ao.id, f.nome, f.cpf
ORDER BY COUNT(ao.id);

-- correção
SELECT l.Id, f.nome, sum(pc.Valor), COUNT(l.id)
FROM funcionarios f 
	JOIN logistas l ON l.Funcionario = f.id
    JOIN pedidoscompras pc ON pc.Logista = l.Id
GROUP BY l.id
ORDER BY COUNT(l.id) DESC
LIMIT 1;

-- ===============================================================================
-- Qual foi o fornecedor que atendeu a mais requisições e a quantidade
USE ERP;

-- tentativa correta
SELECT f.Id, f.nome, sum(r.Quantidade), COUNT(f.id)
FROM fornecedores f 
	JOIN requisitcoes r ON r.Fornecedor = f.id
GROUP BY f.id
ORDER BY COUNT(f.id) DESC
LIMIT 1;