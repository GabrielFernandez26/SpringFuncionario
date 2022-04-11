CREATE DATABASE db_funcionario
GO
USE db_funcionario

CREATE TABLE funcionario(
	codigo		INT				NOT NULL,
	nome		VARCHAR(100),
	salario		DECIMAL(7,2)
	PRIMARY KEY (codigo)
)
GO
CREATE TABLE dependente(
	id						INT				NOT NULL		IDENTITY(100,1),
	codigo_funcionario		INT				NOT NULL,
	nome_funcionario		VARCHAR(100),
	salario_funcionario		DECIMAL(7,2),
	PRIMARY KEY (id),
	FOREIGN KEY (codigo_funcionario) REFERENCES funcionario (codigo) 
)

INSERT INTO funcionario VALUES
(1,'Fulano da Silva', 2000.00),
(2,'Cicrano da Mota', 2500.00),
(3,'Beltrana de Moraes', 2250.00)
GO
INSERT INTO dependente VALUES
(1, 'João da Silva', 1000.00),
(1, 'Maria da Silva', 1000.00),
(2, 'José da Mota', 2000.00),
(3, 'Marina de Moraes', 1500.00)

SELECT * FROM dependente

/*
(Nome_Funcionário, Nome_Dependente, Salário_Funcionário, Salário_Dependente)
*/
CREATE FUNCTION fn_gerar()
RETURNS @tabela TABLE (
nome_funcionario		VARCHAR(100),
nome_dependente			VARCHAR(100),
salario_funcionario		DECIMAL(7,2),
salario_dependente		DECIMAL(7,2)
)
AS 
BEGIN
	INSERT INTO @tabela(nome_funcionario, nome_dependente, salario_funcionario, salario_dependente)
	SELECT f.nome, d.nome_funcionario, f.salario, d.salario_funcionario
	FROM  funcionario f, dependente  d 
	WHERE f.codigo = d.codigo_funcionario
	RETURN
END
SELECT nome_funcionario, nome_dependente, salario_funcionario, salario_dependente FROM fn_gerar()

CREATE FUNCTION fn_salarios(@cod INT)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @salario_funcionario	DECIMAL(7,2),
			@salario_dependentes	DECIMAL(7,2),
			@salario_total			DECIMAL(7,2)
			SELECT @salario_funcionario = salario FROM funcionario WHERE @cod = codigo 
			SELECT @salario_dependentes = SUM(salario_funcionario) FROM dependente WHERE @cod = codigo_funcionario
			SET @salario_total = @salario_funcionario + @salario_dependentes
	RETURN (@salario_total)
END

SELECT dbo.fn_salarios(1) AS Salario
SELECT dbo.fn_salarios(2) AS Salario
SELECT dbo.fn_salarios(3) AS Salario