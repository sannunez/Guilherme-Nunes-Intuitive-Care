SELECT 
	operadoras_cadastradas.Razao_Social,
    REG_ANS, 
    DESCRICAO, 
    (SUM(CAST(REPLACE(VL_SALDO_INICIAL, ',', '.') AS DECIMAL(15,2))) - 
     SUM(CAST(REPLACE(VL_SALDO_FINAL, ',', '.') AS DECIMAL(15,2)))) AS GASTO
FROM demonstracoes_contabeis_2024
JOIN operadoras_cadastradas ON demonstracoes_contabeis_2024.REG_ANS = operadoras_cadastradas.Registro_ANS
WHERE DESCRICAO LIKE '%a saude medico hospitalar%' 
    AND `DATA` >= "2024-01-01" -- Ultimo trimestre registrado no CSV (MES 11 e 12, Não possuem registros)
GROUP BY REG_ANS, DESCRICAO, Razao_Social
ORDER BY GASTO DESC
LIMIT 10;

