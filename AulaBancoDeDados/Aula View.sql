USE ERP;

CREATE OR REPLACE VIEW ListarFuncionarios AS
SELECT ao.id, f.nome, f.cpf, COUNT(ao.id) AS 'Quantidade de chamados atendidos'
FROM funcionarios f 
	JOIN atendentesonline ao ON ao.Funcionario = f.id
	JOIN suporteonline so ON so.AtendenteOnline = ao.Id
GROUP BY ao.id, f.nome, f.cpf HAVING COUNT(ao.id) > 3
ORDER BY COUNT(ao.id) DESC;

SELECT * FROM ListarFuncionarios;

-- Listagem de todos os Clientes e quantidade de pedidos de manutenção realizado por eles

CREATE OR REPLACE VIEW ListagemDeClientesEQtdDePedidos AS 
SELECT DISTINCT pm.id, c.nome, COUNT(pm.id)
FROM clientes c
	LEFT JOIN pedidosmanutencoes pm ON pm.Cliente = c.id
GROUP BY c.id;

SELECT * FROM ListagemDeClientesEQtdDePedidos;

