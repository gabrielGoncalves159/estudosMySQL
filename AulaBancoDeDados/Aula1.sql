-- CREATE DATABASE Aula;

-- USE aula;

CREATE TABLE Alunos(
	Id INT NOT NULL,
    
    Nome VARCHAR(150),
    CPF CHAR(14) NOT NULL,
    Telefone CHAR(15),
    
    CONSTRAINT PK_Alunos PRIMARY KEY (Id) -- Construindo uma PK
);

DROP TABLE Alunos;

-- Código Tipagem alta
-- CHAR ele irá ocupar todos o espaço definido --
-- VARCHAR irá ocupar o tamanho necessario --
-- DROP TABLE deleta a tabela --
-- CREATE cria algo -- 