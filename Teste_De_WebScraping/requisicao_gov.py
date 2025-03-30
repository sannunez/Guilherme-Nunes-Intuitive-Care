# 1. TESTE DE WEB SCRAPING

# lib's imports
import requests
from bs4 import BeautifulSoup
import os
from zipfile import ZipFile, ZIP_DEFLATED

# 1.1 | Acesso ao Site:
def request_e_parse(url):
    requisicao = requests.get(url)
    if requisicao.status_code == 200:
        # Parsing para HTML
        print('Status Requisição | Bem sucedida.\n')
        return BeautifulSoup(requisicao.text, 'html.parser')
    else:
        print('''Status Requisição: Falhou. 
              Verifique o URL solicitado''')
        return None

# 1.2 | Download dos Anexos I e II em formato PDF:
def download_anexos(soup, nome_pasta_anexos):
    links_anexos = soup.find_all('a', class_='internal-link')

    # Diretorio de anexos
    pasta_path = f'Teste_de_WebScraping/{nome_pasta_anexos}'
    os.makedirs(pasta_path, exist_ok=True) 
    
    # Iterador (Modifica nomes para: Anexo 1, Anexo 2, ..., Anexo n.)
    i = 0

    # Coletando links dos anexos.pdf
    for a in links_anexos:
        if 'Anexo' in a['href']:
            if '.pdf' in a['href']:
                anexo_link = requests.get(a['href'])
                i += 1 # Iterador incrementando
                with open(f'{pasta_path}/Anexo{i}.pdf', 'wb') as anexo:
                  anexo.write(anexo_link.content)
                  print(f'Arquivo PDF: Anexo{i} | Baixado com sucesso.')

    return pasta_path 


def zipar(zip_nome, pasta_path):

    with ZipFile(f'Teste_de_WebScraping/{zip_nome}.zip', 'w', ZIP_DEFLATED) as arquivo_zip:
        for raiz, _, arquivos in os.walk(pasta_path):
            for arquivo in arquivos:
                caminho_completo = os.path.join(raiz, arquivo)
                caminho_no_zip = os.path.relpath(caminho_completo, pasta_path)
                arquivo_zip.write(caminho_completo, caminho_no_zip)
    print(f'Arquivo Zip: {zip_nome} | Criado com sucesso.')

# EXECUÇÃO
requisicao = request_e_parse("https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos")
anexos = download_anexos(requisicao, 'Anexos')
zipar('Meus_Anexos', anexos)