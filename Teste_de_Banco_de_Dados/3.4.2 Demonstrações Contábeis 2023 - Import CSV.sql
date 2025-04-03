-- IMPORT DOS TRIMESTRES PARA AS RESPECTIVAS TABELAS 2023
LOAD DATA INFILE 'C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\2023\\1T2023.csv' -- Caminho para o arquivo 1T2023
INTO TABLE demonstracoes_contabeis_2023
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\2023\\2t2023.csv' -- Caminho para o arquivo 2T2023
INTO TABLE demonstracoes_contabeis_2023
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\2023\\3T2023.csv' -- Caminho para o arquivo 3T2023
INTO TABLE demonstracoes_contabeis_2023
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\2023\\4T2023.csv' -- Caminho para o arquivo 4T2023
INTO TABLE demonstracoes_contabeis_2023_4_trimestre
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- CORRIGIR DATAS 4 trimestre
SET SQL_SAFE_UPDATES = 0;
UPDATE demonstracoes_contabeis_2023_4_trimestre
SET `DATA` = STR_TO_DATE(`DATA`, '%d/%m/%Y'); -- corrigindo datas manualmente
SET SQL_SAFE_UPDATES = 1;


-- INSERINDO 4 SEMESTRE NA TABELA
INSERT INTO demonstracoes_contabeis_2023
SELECT * FROM demonstracoes_contabeis_2023_4_trimestre;


-- DELETANDO TABELA EXTRA APOS EXTRAÇÃO DOS DADOS
DROP TABLE IF EXISTS demonstracoes_contabeis_2023_4_trimestre;






