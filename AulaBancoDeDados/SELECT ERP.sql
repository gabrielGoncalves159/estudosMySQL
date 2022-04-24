 INSERT INTO clientes (nome, cpf, telefone)
 VALUES ("Silvio Maciel Banha", "783.308.670-30", "(99) 99999-9999");

-- SELECT id, nome, cpf, telefone FROM clientes;
-- SELECT * FROM clientes;
-- SELECT nome as FullName, cpf as ID, telefone as Phone FROM clientes;

-- SELECT * FROM clientes WHERE id = 1 AND nome = "Silvio Maciel Banha";
-- SELECT * FROM clientes WHERE id = 1 OR nome = "Silvio Maciel Banha";
-- SELECT * FROM clientes WHERE id = 1 OR nome = "Silvio Maciel Banha" ORDER BY nome ASC;
-- SELECT * FROM clientes WHERE id = 1 OR nome = "Silvio Maciel Banha" ORDER BY nome DESC;

UPDATE clientes SET nome = "Atualizado" WHERE id = 3;
DELETE FROM clientes WHERE id = 3;

SELECT * FROM clientes;

SELECT * FROM clientes LIMIT 5;

CREATE TABLE numeros(
	numero INT NOT NULL
);

INSERT INTO numeros (numero) VALUES (1);
INSERT INTO numeros (numero) VALUES (2);
INSERT INTO numeros (numero) VALUES (3);
INSERT INTO numeros (numero) VALUES (4);

SELECT MIN(numero) FROM numeros; -- Menor número
SELECT MAX(numero) FROM numeros; -- Maior numero
SELECT COUNT(*) FROM numeros; -- Numero de registros que tem no banco, quantidade
SELECT AVG(numero) FROM numeros; -- Média
SELECT SUM(numero) FROM numeros; -- Soma
SELECT * FROM clientes WHERE nome LIKE "Silvio%"; -- pesquisa texto no começo da palavra
SELECT * FROM clientes WHERE nome LIKE "%Silvio"; -- pesquisa texto no final da palavra
SELECT * FROM clientes WHERE nome LIKE "%Silvio%"; -- pesquisa texto no geral a palavra

-- r%
-- %r
-- _r% - segundo caracter
-- r_% começa com a letra e tem que ter dois caracteres
-- r__% começa com a letra e tem que ter tres caracteres

SELECT * FROM clientes WHERE id IN(1, 2, 3, 4, 5); -- Array/Lista
SELECT * FROM clientes WHERE id IN (SELECT id FROM clientes); -- estra entre alguma coisa, vai trazer essas informações

SELECT * FROM numeros WHERE numero BETWEEN 2 AND 3;


