-- DELETE FROM clientes WHERE 1=1;

INSERT INTO funcionarios (nome, cpf, ctps)
VALUES ("Murilo", "123.456.789-00", "841.32354.88-0");

SELECT * FROM funcionarios;

INSERT INTO Logistas (Id, Funcionario)
VALUES (1, 1);

SELECT * FROM Logistas;

INSERT INTO funcionarios (nome, cpf, ctps)
VALUES ("Murilo", "123.456.789-00", "841.32354.88-0");

SELECT * FROM funcionarios;

INSERT INTO Tecnicos (Id, Funcionario)
VALUES (2, 2);

SELECT * FROM Tecnicos;

INSERT INTO Clientes (nome, cpf, telefone)
VALUES ("Rutyelle", "123.456.789-00", "(99) 99999-9999");

SELECT * FROM Clientes;

INSERT INTO pedidosManutencoes(descricao, valor, logista, cliente)
VALUE ("Manutenção note empresa", 149.99, 1, 15);

SELECT * FROM pedidosManutencoes;

INSERT INTO funcionarios (nome, cpf, ctps)
VALUES ("Carolina", "123.456.789-00", "841.62654.88-9");

SELECT * FROM funcionarios;

INSERT INTO AtendentesOnline (Id, Funcionario)
VALUE (3, 3);

SELECT * FROM AtendentesOnline;

INSERT INTO SuporteOnline (Descricao, Data, tipo, atendenteonline, cliente)
VALUES ("Site caiu", "2022-01-02 10:00:00", "Problemas no site", 3, 15);

SELECT * FROM SuporteOnline;

TRUNCATE TABLE pedidosmanutencoes; -- LIMPA, ZERA A TABELA

INSERT INTO pedidosManutencoes(descricao, valor, logista, cliente)
VALUE ("Manutenção note empresa", 149.99, 1, 15);

SELECT * FROM pedidosmanutencoes;

TRUNCATE TABLE pedidosmanutencoes; 
TRUNCATE TABLE pedidoscompras; 
TRUNCATE TABLE suporteonline; 
TRUNCATE TABLE logistas; 
