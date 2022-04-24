-- Faturamento total dos pedidos de manutenções
SELECT SUM(Valor) AS 'Faturamento Total PM' FROM Pedidosmanutencoes;

-- Média do preço de manutençãoptimiz
SELECT AVG(Valor) AS 'Media De Preço' FROM Pedidosmanutencoes;

-- Faturamento total dos pedidos de compras
SELECT SUM(Valor) AS 'Faturamento Total PC'FROM Pedidoscompras;

-- Média do preço de compras
SELECT AVG(Valor) AS 'Media Valor PC' FROM Pedidoscompras;

-- Valor máximo e mínimo de pedido de manutençãoptimize
SELECT MAX(Valor) AS 'Valor Máximo', MIN(Valor) AS 'Valor Mínimo' FROM Pedidosmanutencoes;

-- Valor máximo e mínino de pedido de compras
SELECT MAX(Valor) AS 'Valor Máximo', MIN(Valor) AS 'Valor Mínino' FROM Pedidoscompras;

-- Listagem e quantidade de clientes que possuem o DDD 96
SELECT * FROM clientes WHERE Telefone LIKE "_96%";

-- Clientes que possuem telefone que termina com o número 3
SELECT * FROM clientes WHERE telefone LIKE '%3';

-- Listagem de tecnicos que não possuem CNH
SELECT * FROM funcionarios WHERE id IN (SELECT Funcionario FROM tecnicos WHERE cnh IS NULL);

-- Listagem de tecnicos que possuem CNH
SELECT * FROM funcionarios WHERE id IN (SELECT Funcionario FROM tecnicos WHERE cnh IS NOT NULL);

-- Quantidade de atendimento online realizados no mês 3
SELECT count(*) FROM suporteonline WHERE DATA BETWEEN '2021-03-01' AND '2021-03-31';
-- WHERE MONTH(data) = 3;

-- Listar clientes que realizaram uma solicitação de manutenção
SELECT * FROM clientes WHERE id IN (SELECT cliente FROM pedidosmanutencoes);

-- Listar clientes que nunca realizaram uma solicitação de manutenção 
SELECT * FROM clientes WHERE id NOT IN (SELECT cliente FROM pedidosmanutencoes);

-- Listar clientes que realizaram um pedido de compra
SELECT * FROM clientes WHERE id IN (SELECT cliente FROM pedidoscompras);

-- Listar clientes que nunca realizaram um pedido de compra
SELECT * FROM clientes WHERE id NOT IN (SELECT cliente FROM pedidoscompras);

-- Listar atendentes que já realizaram atendimento online a um cliente em novembro
SELECT * FROM funcionarios WHERE id IN (SELECT funcionario FROM atendentesonline WHERE id IN(
SELECT atendenteonline FROM suporteonline WHERE month(DATA) = 11));