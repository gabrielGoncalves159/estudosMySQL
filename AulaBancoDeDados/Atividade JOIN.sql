CREATE DATABASE sistema_estoque
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE sistema_estoque;

CREATE TABLE TabelaDeCategorias (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    atividade CHAR(3) NOT NULL,  
    
    CONSTRAINT PK_TabelaDeCategorias PRIMARY KEY (id)
);

CREATE TABLE TabelaDeProdutos (
	id INT AUTO_INCREMENT,
    Descricao CHAR (150) NOT NULL,
    Preco DECIMAL (8 ,2) NOT NULL,
    url_imagem VARCHAR (250),
    
    Categoria INT,
    
    CONSTRAINT PK_TabelaDeProdutos PRIMARY KEY (id),
    CONSTRAINT FK_TabelaDeProdutos_Categoria FOREIGN KEY (Categoria) REFERENCES TabelaDeCategorias (id)
);

INSERT INTO TabelaDeCategorias (nome, atividade) VALUES ("Informática", "[v]");
INSERT INTO TabelaDeCategorias (nome, atividade) VALUES ("Telefonia", "[v]");
INSERT INTO TabelaDeCategorias (nome, atividade) VALUES ("Games", "[v]");
INSERT INTO TabelaDeCategorias (nome, atividade) VALUES ("Tv, Áudio e Vídeo", "[v]");
INSERT INTO TabelaDeCategorias (nome, atividade) VALUES ("Impressão e Imagem", "[v]");

SELECT * FROM TabelaDeCategorias;

INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (1, "SSD 128GB", 300, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (1, "SSD 256GB", 500, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (1, "KIT TECLADO E MOUSE", 600, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (3, "PLAYSTATION 3", 1500, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (2, "SAMSUNG A51", 2500, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (4, "TELEVISÃO LG 55'", 3000, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (3, "PLAYSTATION 3 1TB", 1500, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (2, "SAMSUNG 59", 2500, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (2, "IPHONE 8", 2500, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (2, "IPHONE 9", 3000, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (2, "IPHONE X", 4000, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (4, "TELEVISÃO SAMSUNG 32'", 1000, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (4, "TELEVISÃO SAMSUNG 40'", 3000, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (3, "PLAYSTATION 4 1TB", 2800, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (3, "PLAYSTATION 5 1TB", 5000, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (1, "Teclado Gamer Razer", 250, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (1, "Fone de ouvido hyperx", 170, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (1, "Mouse Gamer Razer", 90, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (1, "Mouse Gamer Razer 2400", 200, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (null, "Mouse Gamer", 280, null);
INSERT INTO TabelaDeProdutos (Categoria, Descricao, Preco, url_imagem) VALUES (null, "Teclado Gamer", 390, null);

SELECT * FROM TabelaDeProdutos;

-- Exercício 1) Crie uma query que traga só os produtos que tem categorias.
SELECT p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem, c.id, c.nome, c.atividade
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id;

-- Exercício 2) Crie uma query que traga todos os produtos, mesmo que não tenha categoria.
SELECT p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem, c.id, c.nome, c.atividade
FROM TabelaDeCategorias c
	RIGHT JOIN TabelaDeProdutos p ON p.Categoria = c.id;
    
-- Exercício 3) Crie uma query que traga todos os produtos que tem categorias, e também traga categorias 
-- que não tem produtos.

SELECT p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem, c.id, c.nome, c.atividade
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    JOIN TabelaDeCategorias ON c.TabeladeProdutos = NULL;

-- Exercício 4) Crie uma query que trás os produtos e categorias mesmo que não estejam interligados.


-- Exercício 5) Crie uma query que traga todos os produtos da categoria Informática.
SELECT c.id, c.nome, c.atividade, p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    WHERE c.id = 1;
    
-- Exercício 6) Crie uma query que traga todos os produtos da categoria Telefonia ordenado por descrição 
-- do produto.
SELECT c.id, c.nome, c.atividade, p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    WHERE c.id = 2
    ORDER BY descricao;

-- Exercício 7) Crie uma query que traga todos os produtos da categoria Games.
SELECT c.id, c.nome, c.atividade, p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    WHERE c.id = 3;

-- Exercício 8) Crie uma query que traga todos os produtos da categoria Tv, Áudio e Vídeo.
SELECT c.id, c.nome, c.atividade, p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    WHERE c.id = 4;
    
-- Exercício 9) Crie uma query que traga todos os produtos de todas as categorias ordenado pelo id da categoria.
SELECT c.id, c.nome, c.atividade, p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    ORDER BY c.id;

-- Exercício 10) Crie uma query que traga todos os produtos que tenham categoria ordenados por descrição.
SELECT p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem,  c.id, c.nome, c.atividade
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    ORDER BY descricao;

-- Exercício 11) Crie uma query que traga todos os produtos da categoria de informática que tenha preço menor que 
-- 400 ordenado por menor preço.
SELECT c.nome, c.atividade,p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    WHERE c.id = 1
    HAVING p.preco < 400
    ORDER BY preco ASC;

-- Exercício 12) Crie uma query que traga todos os produtos da categoria de games que tenham preço entre 
-- 1600 e 3000 ordenado por maior preço.
SELECT c.id, c.nome, c.atividade,p.id, c.id AS id_categoria, p.descricao, p.preco, p.url_imagem
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    WHERE c.id = 3
    HAVING p.preco >= 1600 AND p.preco <= 3000
    ORDER BY preco DESC;
    
-- Exercício 13) Crie uma query que traga a quantidade de produtos por categoria, exibindo o nome da categoria.
SELECT c.id, c.nome, COUNT(p.id)
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    GROUP BY c.id, c.nome
    ORDER BY COUNT(p.id);

-- Exercício 14) Crie uma query que traga a soma dos preços de produtos por categoria, exibindo o nome da 
-- categoria e ordene por preço.
SELECT c.id, c.nome, sum(p.Preco) AS soma_precos
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    GROUP BY c.id, c.nome
    ORDER BY p.Preco DESC;

-- Exercício 15) Crie uma query que traga a média dos preços de produtos por categoria, exibindo o nome da 
-- categoria e ordene pelo maior preço.
SELECT c.id, c.nome, AVG(p.Preco) AS soma_precos
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    GROUP BY c.id, c.nome
    ORDER BY p.Preco DESC;

-- Exercício 16) Crie uma query que traga o menor valor de produto por categoria, exibindo o nome da categoria, 
-- ordenado pela categoria.
SELECT c.id, c.nome, MIN(p.Preco) AS soma_precos
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    GROUP BY c.id, c.nome
    ORDER BY c.nome;

-- Exercício 17) Crie uma query que traga o maior valor de produto por categoria, exibindo o nome da categoria, 
-- ordenado pela categoria.	
SELECT c.id, c.nome, MAX(p.Preco) AS soma_precos
FROM TabelaDeCategorias c
	JOIN TabelaDeProdutos p ON p.Categoria = c.id
    GROUP BY c.id, c.nome
    ORDER BY c.nome;