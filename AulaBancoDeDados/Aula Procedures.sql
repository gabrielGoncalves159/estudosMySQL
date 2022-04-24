USE ERP;

DROP PROCEDURE Teste;
-- Para o MySQL não existe alteração para o procedure, tem que excluir e criar novamente.

DELIMITER //

CREATE PROCEDURE Teste (
	id INT,
    nome VARCHAR(250)
)
BEGIN
	SELECT id, nome;
END //

DELIMITER ;

CALL Teste(1, "Oi");

-- ============================================================================================

