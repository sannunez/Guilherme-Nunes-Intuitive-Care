-- RELATORIO DE CADASTRO ORIGINAL
CREATE TABLE relatorio_cadop(
	Registro_ANS INTEGER,	
	CNPJ VARCHAR(14),
	Razao_Social VARCHAR(200),
	Nome_Fantasia VARCHAR(200),
	Modalidade VARCHAR(50),
    Logradouro	VARCHAR(200),
	Numero	VARCHAR(50),
	Complemento	VARCHAR(100),
	Bairro	VARCHAR (100),
	Cidade	VARCHAR(50),
	UF	VARCHAR(2),
	CEP	INTEGER,
	DDD	VARCHAR(2),
	Telefone VARCHAR(50),	
	Fax	VARCHAR(40) ,
    Endereco_eletronico	VARCHAR(100),
    Representante VARCHAR(100),
	Cargo_Representante	VARCHAR(100),
	Regiao_de_Comercializacao VARCHAR(1),
	Data_Registro_ANS DATE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


-- CRIANDO SUBDIVISÕES: Registro_ANS em ambas, para realizar INNER JOIN, e LEFT JOIN.
-- TABELA PARA: Informações Gerais  | Nome, Atuação, Etc.
CREATE TABLE operadoras_cadastradas(
	Registro_ANS INTEGER,	
	CNPJ VARCHAR(14),
	Razao_Social VARCHAR(200),
	Nome_Fantasia VARCHAR(200),
	Modalidade VARCHAR(50)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- TABELA PARA: Informações sobre localização|contato|acesso. 
CREATE TABLE operadoras_acesso(
	Registro_ANS INTEGER,
	Logradouro	VARCHAR(200),
	Numero	VARCHAR(50),
	Complemento	VARCHAR(100),
	Bairro	VARCHAR (100),
	Cidade	VARCHAR(50),
	UF	VARCHAR(2),
	CEP	INTEGER,
	DDD	VARCHAR(2),
	Telefone VARCHAR(50),	
	Fax	VARCHAR(40) ,
    Endereco_eletronico	VARCHAR(100),
    Representante VARCHAR(100),
	Cargo_Representante	VARCHAR(100),
	Regiao_de_Comercializacao VARCHAR(1),
	Data_Registro_ANS DATE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;