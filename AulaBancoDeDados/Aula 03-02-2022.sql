USE ERP;

DROP PROCEDURE ListaDeClientes;

DELIMITER //
CREATE PROCEDURE ListaDeClientes (
	id INT, 
    nome VARCHAR (250)
)
BEGIN
	SELECT c.id, c.nome FROM Clientes c
    WHERE (id IS NULL OR c.id = id)
    AND (nome IS NULL OR c.nome LIKE CONCAT("%",nome,"%"));
END //
DELIMITER ;

CALL ListaDeClientes (1, "Maciel");
-- CALL ListaDeClientes (null , null);
-- CALL ListaDeClientes (1 , null);
-- CALL ListaDeClientes (null , "Maciel");