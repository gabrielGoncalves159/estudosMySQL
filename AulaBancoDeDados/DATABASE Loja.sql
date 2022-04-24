CREATE DATABASE Loja
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE Loja;

CREATE TABLE Funcionarios (
	Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR (150) NOT NULL,
    CPF CHAR (14) NOT NULL,
    CTPS CHAR (12) NOT NULL,
    Gerente INT,
    
    CONSTRAINT FK_Funcionarios_Gerente FOREIGN KEY (Id) REFERENCES Funcionarios(Id),
	CONSTRAINT PK_Funcionarios PRIMARY KEY (Id)
);


CREATE TABLE Logistas (
	Id INT NOT NULL AUTO_INCREMENT,
    Funcionario INT NOT NULL,
    
    CONSTRAINT PK_Logistas PRIMARY KEY(Id),
    CONSTRAINT FK_Logistas_Funcionario FOREIGN KEY (Funcionario) REFERENCES Funcionarios(Id) 
);

CREATE TABLE Tecnicos(
	Id INT NOT NULL AUTO_INCREMENT,
    CNH CHAR (10) NOT NULL,
    Funcionario INT NOT NULL,
    
    CONSTRAINT PK_Tecnicos PRIMARY KEY(Id),
    CONSTRAINT FK_Tecnicos_Funcionario FOREIGN KEY (Funcionario) REFERENCES Funcionarios(Id)
);

CREATE TABLE AtendentesOnline (
	Id INT NOT NULL AUTO_INCREMENT,
    Funcionario INT NOT NULL,
    
    CONSTRAINT PK_AtendentesOline PRIMARY KEY(Id),
    CONSTRAINT FK_AtendentesOnline_Funcionario FOREIGN KEY (Funcionario) REFERENCES Funcionarios(Id)
);

CREATE TABLE Estoquistas(
	Id INT NOT NULL AUTO_INCREMENT,
    Funcionario INT NOT NULL,
    
    CONSTRAINT PK_Estoquista PRIMARY KEY(Id),
    CONSTRAINT FK_Estoquisnta_Funcionario FOREIGN KEY (Funcionario) REFERENCES Funcionarios(Id) 
);

CREATE TABLE Fornecedores(
	Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(150) NOT NULL,
    
    CONSTRAINT PK_Fornecedores PRIMARY KEY(Id)
);

CREATE TABLE Clientes(
	Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR (150) NOT NULL,
    CPF CHAR (14) NOT NULL,
    Telefone CHAR (14) NOT NULL,
    
    CONSTRAINT PK_Clientes PRIMARY KEY(Id)
);

CREATE TABLE Requisicoes(
	Id INT NOT NULL AUTO_INCREMENT,
	Produto VARCHAR (50) NOT NULL,
	Quantidade INT (3) NOT NULL,
    
    Estoquista INT NOT NULL,
    Fornecedor INT NOT NULL,
    
    CONSTRAINT PK_Requisicoes PRIMARY KEY(Id),
    CONSTRAINT FK_Requisicoes_Estoquista FOREIGN KEY (Estoquista) REFERENCES Estoquistas(Id),
    CONSTRAINT FK_Requisicoes_Fornecedor FOREIGN KEY (Fornecedor) REFERENCES Fornecedores(Id)
);

CREATE TABLE SolicitacoesEstoque(

	Id INT NOT NULL AUTO_INCREMENT,
	Descricao VARCHAR (50) NOT NULL,
	Produto VARCHAR (50) NOT NULL,
	Quantidade INT (3) NOT NULL,
    
    Tecnico INT NOT NULL,
    Estoquista INT NOT NULL,
    
    CONSTRAINT PK_SolicitacoesEstoque PRIMARY KEY(Id),
	CONSTRAINT FK_SolicitacoesEstoque_Tecnico FOREIGN KEY (Tecnico) REFERENCES Tecnicos(Id),
    CONSTRAINT FK_SolicitacoesEstoque_Estoquista FOREIGN KEY (Estoquista) REFERENCES Estoquistas(Id)
);

CREATE TABLE OrdemServicos(
	Id INT NOT NULL AUTO_INCREMENT,
    Valor DECIMAL(4, 2) NOT NULL,
	Descricao VARCHAR (50) NOT NULL,
	Tempo CHAR (5) NOT NULL,
    Tecnico INT NOT NULL,
    Logista INT NOT NULL,
    
    CONSTRAINT PK_OrdemServicos PRIMARY KEY (Id),
	CONSTRAINT FK_OrdemServicos_Tecnico FOREIGN KEY (Tecnico) REFERENCES Tecnicos(Id),
    CONSTRAINT FK_OrdemServicos_Logista FOREIGN KEY (Logista) REFERENCES Logistas(Id)
);

CREATE TABLE SuporteOnline(
	Id INT NOT NULL AUTO_INCREMENT,
	Descricao VARCHAR (50) NOT NULL,
	DataAtendimento CHAR (50) NOT NULL,
	Tipo CHAR (20) NOT NULL,
    
    AtendenteOnline INT NOT NULL,
	Cliente INT NOT NULL,
    
    CONSTRAINT PK_SuporteOnline PRIMARY KEY (Id),
	CONSTRAINT FK_SuporteOnline_AtendenteOnline FOREIGN KEY (AtendenteOnline) REFERENCES AtendentesOnline(Id),
    CONSTRAINT FK_SuporteOnline_Cliente FOREIGN KEY (Cliente) REFERENCES Clientes(Id)    
);

CREATE TABLE PedidosManutencoes(
	Id INT NOT NULL AUTO_INCREMENT,
    Descricao VARCHAR (50) NOT NULL,
    Valor DECIMAL(4, 2) NOT NULL,
    
    Logista INT NOT NULL,
	Cliente INT NOT NULL,
    
    CONSTRAINT PK_PedidosManutencoes PRIMARY KEY(Id),
    CONSTRAINT FK_PedidosManutencoes_Logista FOREIGN KEY (Logista) REFERENCES Logistas(Id),
    CONSTRAINT FK_PedidosManutencoes_Cliente FOREIGN KEY (Cliente) REFERENCES Clientes(Id)
);

CREATE TABLE PedidosCompras(
	Id INT NOT NULL AUTO_INCREMENT,
    Produto VARCHAR (50) NOT NULL,
    Valor DECIMAL(4, 2) NOT NULL,
    Desconto INT(3) NOT NULL,
    
    Logista INT NOT NULL,
	Cliente INT NOT NULL,
    
    CONSTRAINT PK_PedidosCompras PRIMARY KEY(Id),
    CONSTRAINT FK_PedidosCompras_Logista FOREIGN KEY (Logista) REFERENCES Logistas(Id),
    CONSTRAINT FK_PedidosCompras_Cliente FOREIGN KEY (Cliente) REFERENCES Clientes(Id)
);
