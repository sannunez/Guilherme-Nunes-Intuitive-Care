-- IMPORTANDO PARA O RELATORIO DE CADASTRO ORIGINAL
LOAD DATA INFILE "C:\\Users\\sannunez\\Desktop\\Guilherme\\Guilherme-Nunes-Intuitive-Care\\Teste_de_Banco_de_Dados\\Relatorio_cadop.csv" -- LOCAL DADOS CADASTRAIS
INTO TABLE relatorio_cadop
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CRIANDO SUBDIVISÕES: Registro_ANS em ambas, para realizar INNER JOIN, e LEFT JOIN.
-- TABELA PARA: Informações Gerais  | Nome, Atuação, Etc.
INSERT INTO operadoras_cadastradas (Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade)
SELECT Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade  
FROM relatorio_cadop;

-- TABELA PARA: Informações sobre localização|contato|acesso. 
INSERT INTO operadoras_acesso (Registro_ANS, Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_Eletronico, Representante, Cargo_Representante, Regiao_de_Comercializacao, Data_Registro_ANS)
SELECT Registro_ANS, Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_Eletronico, Representante, Cargo_Representante, Regiao_de_Comercializacao, Data_Registro_ANS
FROM relatorio_cadop;



