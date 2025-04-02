CREATE TABLE demonstracoes_contabeis_2023_123_trimestre(
	`DATA` DATE,
    REG_ANS INTEGER,	
    CD_CONTA_CONTABIL INTEGER(9),	
    DESCRICAO VARCHAR(150),	
    VL_SALDO_INICIAL VARCHAR(15), -- sera convertido para decimal xxxx.yy no SELECT FROM
    VL_SALDO_FINAL VARCHAR(15)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE demonstracoes_contabeis_2023_4_trimestre(
	`DATA` VARCHAR(15),  -- sera convertido para data no formato correto, uma vez que o arquivo CSV esta no formato errado
    REG_ANS INTEGER,	
    CD_CONTA_CONTABIL INTEGER(9),	
    DESCRICAO VARCHAR(150),	
    VL_SALDO_INICIAL VARCHAR(15),
    VL_SALDO_FINAL VARCHAR(15)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE demonstracoes_contabeis_2024(
	`DATA` VARCHAR(15),
    REG_ANS INTEGER,	
    CD_CONTA_CONTABIL INTEGER(9),	
    DESCRICAO VARCHAR(150),	
	VL_SALDO_INICIAL VARCHAR(15),
    VL_SALDO_FINAL VARCHAR(15)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
