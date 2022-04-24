CREATE DATABASE IF NOT EXISTS bdcoldigo DEFAULT CHARACTER SET utf8 ;

USE bdcoldigo;

CREATE TABLE IF NOT EXISTS marcas (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);
-- UNSIGNED ("Sem sinal") aceita apenas numero inteiros

CREATE TABLE IF NOT EXISTS produtos (
	id INT(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    categoria TINYINT(1) UNSIGNED NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    capacidade INT(4) UNSIGNED NOT NULL,
    valor DECIMAL(7,2) UNSIGNED NOT NULL,
    marcas_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    INDEX fk_produtos_marcas_id (marcas_id ASC),
    CONSTRAINT fk_produtos_marcas FOREIGN KEY (marcas_id) REFERENCES marcas (id)
);
-- ZEROFILL - Preenche com zeros

INSERT INTO marcas(nome) VALUES('SAMGUNG');
INSERT INTO marcas(nome) VALUES('PHILIPS');
INSERT INTO marcas(nome) VALUES('CONSUL');

SELECT produtos.*, marcas.nome AS marcas FROM produtos INNER JOIN marcas ON produtos.marcas_id = marcas.id;
DELETE FROM produtos WHERE id = "1";

-- SELECT * FROM  marcas;
-- SELECT * FROM produtos;