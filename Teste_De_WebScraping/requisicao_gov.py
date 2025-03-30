# lib's imports
import requests
from bs4 import BeautifulSoup
import os
from zipfile import ZipFile, ZIP_DEFLATED

def request_e_parse(url):
    requisicao = requests.get(url)
    if requisicao.status_code == 200:
        # Parsing para HTML
        return BeautifulSoup(requisicao.text, 'html.parser')
    else:
        print('''Status Requisição: Falhou. 
              Verifique o URL solicitado''')
        return None

def download_zip_anexos(soup):
    links_anexos = soup.find_all('a', class_='internal-link')

    # Diretorio de anexos
    os.makedirs('Anexos', exist_ok=True) 

    # Iterador (Modifica nomes para: Anexo 1, Anexo 2, ..., Anexo n.)
    i = 0

    # Coletando links dos anexos.pdf
    for a in links_anexos:
        if 'Anexo' in a['href']:
            if '.pdf' in a['href']:
                anexo_link = requests.get(a['href'])
                i += 1 # Iterador incrementando
                with open(f'Anexos/Anexo{i}.pdf', 'wb') as anexo:
                  anexo.write(anexo_link.content)       

    # Zipando anexos
    with ZipFile('Anexos.zip', 'w', ZIP_DEFLATED) as arquivo_zip:
        for raiz, _, arquivos in os.walk('Anexos'):
            for arquivo in arquivos:
                caminho_completo = os.path.join(raiz, arquivo)
                caminho_no_zip = os.path.relpath(caminho_completo, 'Anexos')
                arquivo_zip.write(caminho_completo, caminho_no_zip)
    
                
download_zip_anexos(request_e_parse("https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"))
