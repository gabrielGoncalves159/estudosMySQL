CREATE DATABASE Locadora
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE Locadora;

CREATE TABLE Filmes (
	Id INT NOT NULL AUTO_INCREMENT,
    
    Titulo VARCHAR(150) NOT NULL,
    Genero CHAR(15) NOT NULL,
    Estudio CHAR(50) NOT NULL,
    AnoProducao INT(4) NOT NULL,
    PaisOrigem CHAR(11) NOT NULL,
    Idioma CHAR (15) NOT NULL,
    Duracao CHAR (7) NOT NULL,
    
    CONSTRAINT PK_Filmes PRIMARY KEY (Id)
);

CREATE TABLE Atores (
	Id INT NOT NULL AUTO_INCREMENT,
    
	Nome VARCHAR (150) NOT NULL,
    PaisNascimento CHAR (20) NOT NULL,
    DataNascimento CHAR (10) NOT NULL,
    
    CONSTRAINT PK_Atores PRIMARY KEY (Id)
);

CREATE TABLE FilmesAtores (
	Id INT NOT NULL AUTO_INCREMENT,
    
    Papel CHAR(20) NOT NULL,
    EhEstrala BOOLEAN,
    Ator INT NOT NULL,
    Filme INT NOT NULL,
    
	CONSTRAINT PK_FilmesAtores PRIMARY KEY (Id),
    CONSTRAINT FK_FilmesAtores_Filme FOREIGN KEY (Filme) REFERENCES Filmes(Id),
	CONSTRAINT FK_FilmesAtores_Ator FOREIGN KEY (Ator) REFERENCES Atores(Id)
);

CREATE TABLE Fitas (
	Id INT NOT NULL AUTO_INCREMENT,
    
    Numero INT (10) NOT NULL,
    DataCompra CHAR (10) NOT NULL,
    Filme INT NOT NULL,
    
    CONSTRAINT PK_Fitas PRIMARY KEY (Id),
    CONSTRAINT FK_Fitas_Filme FOREIGN KEY (Filme) REFERENCES Filmes(Id)
);

CREATE TABLE Clientes (
	Id INT NOT NULL AUTO_INCREMENT,
    
    -- NumeroAssociado CHAR (5) NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    Telefone CHAR(14) NOT NULL,
	Endereco VARCHAR (150) NOT NULL,
    
	CONSTRAINT PK_Clientes PRIMARY KEY (Id)
);

CREATE TABLE Funcionarios (
	Id INT NOT NULL AUTO_INCREMENT,
    
    Nome VARCHAR (150) NOT NULL,
    Matricula INT (10) NOT NULL,
    Endereco VARCHAR (150) NOT NULL,
    Telefone CHAR(14) NOT NULL,
    Salario DECIMAL(9, 2) NOT NULL,
    
    CONSTRAINT PK_Funcionarios PRIMARY KEY (Id)
);

CREATE TABLE Administradores (
	Id INT NOT NULL AUTO_INCREMENT,
    
    Codigo INT (10) NOT NULL,
    Funcionario INT NOT NULL,
    
    CONSTRAINT PK_Administradores PRIMARY KEY (Id),
    CONSTRAINT FK_Administradores_Funcionario FOREIGN KEY (Funcionario) REFERENCES Funcionarios(Id)
);

CREATE TABLE Atendentes (
	Id INT NOT NULL AUTO_INCREMENT,
    
    Funcionario INT NOT NULL,
    
	CONSTRAINT PK_Atendentes PRIMARY KEY (Id),
    CONSTRAINT FK_Atendentes_Funcionario FOREIGN KEY (Funcionario) REFERENCES Funcionarios(Id)
);

CREATE TABLE Alugueis (
	Id INT NOT NULL AUTO_INCREMENT,
    
    DataAluguel CHAR(10) NOT NULL,
    Atendente INT NOT NULL,
    Fita INT NOT NULL,
    Cliente INT NOT NULL,
    
    CONSTRAINT PK_Alugueis PRIMARY KEY (Id),
    CONSTRAINT FK_Alugueis_Atendente FOREIGN KEY (Atendente) REFERENCES Atendentes(Id),
    CONSTRAINT FK_Alugueis_Fita FOREIGN KEY (Fita) REFERENCES Fitas(Id),
    CONSTRAINT FK_Alugueis_Cliente FOREIGN KEY (Cliente) REFERENCES Clientes(Id)
);

-- recurcividade Gerente -> FK ...