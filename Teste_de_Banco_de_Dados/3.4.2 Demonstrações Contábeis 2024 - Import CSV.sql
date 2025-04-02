-- IMPORT DOS TRIMESTRES PARA AS RESPECTIVAS TABELAS 2024
LOAD DATA INFILE 'C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\2024\\1T2024.csv' -- Caminho para o arquivo 1T2024
INTO TABLE demonstracoes_contabeis_2024
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\2024\\2T2024.csv' -- Caminho para o arquivo 2T2024
INTO TABLE demonstracoes_contabeis_2024
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\2024\\3T2024.csv' -- Caminho para o arquivo 3T2024
INTO TABLE demonstracoes_contabeis_2024
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\2024\\4T2024.csv' -- Caminho para o arquivo 4T2024
INTO TABLE demonstracoes_contabeis_2024
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;