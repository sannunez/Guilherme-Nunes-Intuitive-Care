# 2 Teste de Transformação de Dados

# lib's imports
import pandas as pd
import tabula as tb
import os
from zipfile import ZipFile, ZIP_DEFLATED
from tkinter import filedialog

# 2.1 | Extraindo os dados da Tabela Rol de Procedimentos:
# 2.2 | Salvando dados em tabela estruturada:
def criar_dataframe(pdf_caminho, csv_nome, pagina_de_inicio, pagina_de_fim):
    tb.convert_into(f'{pdf_caminho}', f'Teste_de_Transformacao_de_Dados/{csv_nome}.csv', pages = f'{pagina_de_inicio}-{pagina_de_fim}')
    df = f'Teste_de_Transformacao_de_Dados/{csv_nome}.csv'

    return df


# 2.3 | Compactando csv em arquivo denonimado "Teste_{seu_nome}.zip" 
def zipar(seu_nome, df):
    with ZipFile(f'Teste_de_Transformacao_de_Dados/Teste_{seu_nome}.zip', 'w', ZIP_DEFLATED) as arquivo_zip:
        df_path_zip = os.path.relpath(df,'Teste_de_Transformacao_de_Dados')
        arquivo_zip.write(df, df_path_zip)
    print(f'Arquivo ZIP: Teste_{seu_nome} | Criado com sucesso.')


# 2.4 | Substituindo abreviações
def substituir_abreviacao(dataframe, abreviacao, substituto):

    df = pd.read_csv(dataframe)

    if abreviacao in df.columns:
        coluna = df.columns.get_loc(abreviacao)

        for linha in range(len(df)):
            if pd.notnull(df.iloc[linha, coluna]):
                df.loc[linha, abreviacao] = substituto
        print(f'Processamento concluido | Abreviação {abreviacao} substituida por {substituto}')

        df.to_csv(dataframe, index=False)
    else:
        print(f'''Erro com a abreviação: {abreviacao}. 
Verifique: 1 | Se a coluna existe. 
           2 | Se houve um erro de digitação.''')


# EXECUÇÃO
pdf_caminho = str(os.path.abspath(filedialog.askopenfilename()))
dataframe = criar_dataframe(pdf_caminho, 'Anexo_1', 3, 181)
zipar('Guilherme Nunes', dataframe)
substituir_abreviacao(dataframe, 'OD', 'Seg. Odontológica')
substituir_abreviacao(dataframe, 'AMB', 'Seg. Ambulatórial')

