SELECT Razao_Social, `DATA`, REG_ANS, DESCRICAO, VL_SALDO_INICIAL, VL_SALDO_FINAL, GASTO_TOTAL_2024, RANKING
FROM(
    -- RANKING DAS 10 EMPRESAS
    SELECT 
        Razao_Social, 
        `DATA`, 
        REG_ANS, 
        DESCRICAO, 
        FORMAT(VL_SALDO_INICIAL, 2) AS VL_SALDO_INICIAL, 
        FORMAT(VL_SALDO_FINAL, 2) AS VL_SALDO_FINAL, 
        GASTO_TOTAL_2024,
        GASTO_NUMERICO,
        DENSE_RANK() OVER (ORDER BY GASTO_NUMERICO DESC) AS RANKING
        
    FROM (
        -- OBTENDO OS DADOS FILTRADOS
        SELECT
            operadoras_cadastradas.Razao_Social,
            `DATA`,
            REG_ANS, 
            DESCRICAO,
            VL_SALDO_INICIAL,
            VL_SALDO_FINAL,

            -- CONDICIONAL PARA QUE O VALOR DE GASTO SEJA SOMADO CORRETAMENTE CONSIDERANDO CADA TRIMESTRE ISOLADAMENTE E SOMANDO O TOTAL DE GASTOS
            -- POIS, HÁ TRIMESTRES EM QUE O SALDO INICIAL É DIFERENTE DO SALDO FINAL DO TRIMESTRE PASSADO, LOGO NÃO DEVE SER COMPARADO COM OS VALORES
            -- DO SEU ANTERIOR, DESTA FORMA HÁ APENAS A SOMA TOTAL DE GASTOS EM SI DESCONSIDERANDO ACRESCIMOS EXTERNOS
            SUM(
                CASE 
                    WHEN CAST(REPLACE(VL_SALDO_INICIAL, ',', '.') AS DECIMAL(15,2)) - 
                         CAST(REPLACE(VL_SALDO_FINAL, ',', '.') AS DECIMAL(15,2)) > 0 
                    THEN CAST(REPLACE(VL_SALDO_INICIAL, ',', '.') AS DECIMAL(15,2)) - 
                         CAST(REPLACE(VL_SALDO_FINAL, ',', '.') AS DECIMAL(15,2)) 
                    ELSE 0 
                END
            ) OVER (PARTITION BY REG_ANS) AS GASTO_NUMERICO,

            FORMAT(
                SUM(
                    CASE 
                        WHEN CAST(REPLACE(VL_SALDO_INICIAL, ',', '.') AS DECIMAL(15,2)) - 
                             CAST(REPLACE(VL_SALDO_FINAL, ',', '.') AS DECIMAL(15,2)) > 0 
                        THEN CAST(REPLACE(VL_SALDO_INICIAL, ',', '.') AS DECIMAL(15,2)) - 
                             CAST(REPLACE(VL_SALDO_FINAL, ',', '.') AS DECIMAL(15,2)) 
                        ELSE 0 
                    END
                ) OVER (PARTITION BY REG_ANS), 2) AS GASTO_TOTAL_2024-- FORMATADO PARA MELHOR LEGIBILIDADE

        FROM demonstracoes_contabeis_2024
        JOIN operadoras_cadastradas ON demonstracoes_contabeis_2024.REG_ANS = operadoras_cadastradas.Registro_ANS
        WHERE DESCRICAO LIKE '%a saude medico hospitalar%'
    ) AS subquery_de_dados
) AS subquery_de_ranking
WHERE RANKING <= 10
ORDER BY GASTO_NUMERICO DESC, `DATA` ASC;
