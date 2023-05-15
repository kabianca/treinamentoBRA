CREATE DATABASE treinamento;

USE treinamento;

CREATE TABLE clientes (
    codcliente INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE vendas(
    codvendas INT PRIMARY KEY,
    datavenda DATE NOT NULL,

    codcliente INT,
    codvendedor int
);

CREATE TABLE vendedores(
    codvendedor INT PRIMARY KEY,
    nome VARCHAR(50) NOT null
);

ALTER TABLE vendas ADD CONSTRAINT fk_vendas_codcliente FOREIGN KEY (codcliente) REFERENCES clientes (codcliente);

ALTER TABLE vendas ADD CONSTRAINT fk_vendas_codvendedor FOREIGN KEY (codvendedor) REFERENCES vendedores (codvendedor);

INSERT INTO clientes VALUES (1, "Rafael");

-- Verificando se Rafael foi incluído:
SELECT * FROM clientes

INSERT INTO vendedores VALUES (1, "Gaby");

-- Verificando se Gaby foi incluída:
SELECT * FROM vendedores

INSERT INTO vendas VALUES (10, "2023-04-27", 1, 1)

-- Exercício 1: INSERT
-- 10 registros em cada tabela):
INSERT INTO clientes VALUES (2, "Pedro");
INSERT INTO clientes VALUES (3, "Joaquim");
INSERT INTO clientes VALUES (4, "Gustavo");
INSERT INTO clientes VALUES (5, "Felipe");
INSERT INTO clientes VALUES (6, "Julio");
INSERT INTO clientes VALUES (7, "Anderson");
INSERT INTO clientes VALUES (8, "Paulo");
INSERT INTO clientes VALUES (9, "Cadu");
INSERT INTO clientes VALUES (10, "Daniel");
INSERT INTO clientes VALUES (11, "Guilherme");

SELECT * FROM clientes;

INSERT INTO vendedores VALUES (2, "Maria");
INSERT INTO vendedores VALUES (3, "Luciana");
INSERT INTO vendedores VALUES (4, "Emma");
INSERT INTO vendedores VALUES (5, "Lina");
INSERT INTO vendedores VALUES (6, "Josy");
INSERT INTO vendedores VALUES (7, "Bia");
INSERT INTO vendedores VALUES (8, "Ana");
INSERT INTO vendedores VALUES (9, "Paula");
INSERT INTO vendedores VALUES (10, "Cindy");
INSERT INTO vendedores VALUES (11, "Eliana");

SELECT * FROM vendedores;

INSERT INTO vendas VALUES (20, "2023-04-27", 10, 5)
INSERT INTO vendas VALUES (30, "2023-04-27", 11, 1)
INSERT INTO vendas VALUES (40, "2023-04-27", 5, 3)
INSERT INTO vendas VALUES (50, "2023-04-27", 2, 11)
INSERT INTO vendas VALUES (60, "2023-04-27", 4, 4)
INSERT INTO vendas VALUES (70, "2023-04-27", 6, 1)
INSERT INTO vendas VALUES (80, "2023-04-27", 9, 8)
INSERT INTO vendas VALUES (90, "2023-04-27", 3, 7)
INSERT INTO vendas VALUES (100, "2023-04-27", 7, 6)
INSERT INTO vendas VALUES (110, "2023-04-27", 8, 2)

SELECT * FROM vendas;

----------------------------------------------

-- Exercício 2:
-- Adicionar uma coluna na tabela vendas a gosto (sendo Varchar 255):
ALTER TABLE vendas ADD vendas_info VARCHAR(255);

-- Modificar uma coluna na tabela vendas criada no exercício 1 por varchar 100 (tipagem do campo):
ALTER TABLE vendas MODIFY COLUMN vendas_info VARCHAR(100);

-- Modificar a coluna datavenda na tabela vendas por data_venda:
ALTER TABLE vendas change datavenda data_venda DATE;

-- Excluir a coluna criada no exercício 1 da tabela venda:
ALTER TABLE vendas DROP COLUMN vendas_info;

------------------------------------------------------------

-- Exercicio 3: UPDATE
-- REALIZAR UM UPDATE NA TABELA VENDEDORES, COLOCANDO MAIS UM SOBRENOME EM CADA VENDEDOR (somente em 5 vendedores).
UPDATE vendedores SET NOME = 'Maria Oliveira' WHERE codvendedor = 2;
UPDATE vendedores SET NOME = 'Luciana Silva' WHERE codvendedor = 3;
UPDATE vendedores SET NOME = 'Emma de Paula' WHERE codvendedor = 4;
UPDATE vendedores SET NOME = 'Lina Fernandes' WHERE codvendedor = 5;
UPDATE vendedores SET NOME = 'Josy Lima' WHERE codvendedor = 6;

-- REALIZAR UM UPDATE NA TABELA CLIENTES, COLOCANDO MAIS UM SOBRENOME EM CADA CLIENTE (somente em 5 clientes).
UPDATE clientes SET NOME = 'Pedro Souza' WHERE codcliente = 2;
UPDATE clientes SET NOME = 'Joaquim Silva' WHERE codcliente = 3;
UPDATE clientes SET NOME = 'Gustavo Mourão' WHERE codcliente = 4;
UPDATE clientes SET NOME = 'Felipe Silva' WHERE codcliente = 5;
UPDATE clientes SET NOME = 'Julio Resende' WHERE codcliente = 6;

--------------------------------------------------------------

-- Exercicio 4: MANIPULAÇÃO
-- INNER JOIN VENDAS X CLIENTES:
SELECT
    V.codvendas,
    V.codvendedor,
    V.codcliente as Cliente
FROM
    vendas V
INNER JOIN
  clientes C
ON V.codcliente = C.codcliente

-- LEFT JOIN VENDAS X VENDEDORES:
SELECT *
FROM
    vendas V
LEFT JOIN
  vendedores Vd
ON V.codvendedor = Vd.codvendedor;

-- RIGHT JOIN VENDAS X VENDEDORES:
SELECT *
FROM
    vendas V
RIGHT JOIN
    vendedores Vd
ON
    V.codvendedor = Vd.codvendedor;

-- INNER JOIN VENDAS X CLIENTES e LEFT JOIN VENDAS X VENDEDORES:
SELECT *
FROM
    vendas AS v
INNER JOIN
    clientes AS c
ON
    c.codcliente = v.codcliente
LEFT JOIN
    vendedores AS vd
ON
    vd.codvendedor = v.codvendedor;

-- LEFT JOIN VENDAS X CLIENTES e RIGHT JOIN VENDAS X VENDEDORES, GROUP BY POR DATAVENDA, ORDER BY DESC POR DATAVENDA E UM LIMIT DE 1:
SELECT *
FROM
    vendas AS v
INNER JOIN
    clientes AS c
ON
    c.codcliente = v.codcliente
LEFT JOIN
    vendedores AS vd
ON
    vd.codvendedor = v.codvendedor
GROUP BY
    v.cod_vendas
LIMIT
    1;