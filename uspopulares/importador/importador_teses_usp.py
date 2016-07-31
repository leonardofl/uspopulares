import urllib.request
import json
from datetime import date, datetime
from api import models

JSON_URL = 'https://github.com/leonardofl/uspopulares/blob/master/teses_usp_crawler/teses_usp_crawler/publicacoes.json?raw=true'

class ImportadorTesesUsp:

    def importar(self):
        print('Acessando publicações em', JSON_URL)
        response = urllib.request.urlopen(JSON_URL)
        publicacoes = json.loads(response.read().decode('utf-8'))
        print('Importando', len(publicacoes), 'publicações.')
        parser = PublicaoJsonParser()
        for publicacao_json in publicacoes:
            publicacao = parser.parse(publicacao_json)
            publicacao.save()
            # TODO importação idempotente
        print('Importação concluída')

class PublicaoJsonParser:

    def parse(self, publicacao_json):
        publicacao = models.Publicacao()
        publicacao.titulo = publicacao_json['titulo']
        publicacao.tipo = publicacao_json['tipo']
        publicacao.autor = publicacao_json['autor']
        nome_unidade = publicacao_json['unidade']
        try:
            sigla_unidade = models.UnidadesUsp.get_sigla_from(nome_unidade)
            publicacao.unidade = sigla_unidade
        except KeyError:
            publicacao.unidade = nome_unidade
        publicacao.area_conhecimento = publicacao_json['area_conhecimento']
        timestamp = publicacao_json['data_defesa']
        publicacao.data_defesa = datetime.strptime(timestamp, "%Y-%m-%d").date()
        publicacao.ano_publicacao = int(publicacao_json['ano_publicacao'])
        publicacao.orientador = publicacao_json['orientador']
        publicacao.banca = publicacao_json['banca']
        publicacao.palavras_chaves = publicacao_json['palavras_chaves']
        publicacao.visitas = int(publicacao_json['visitas'])
        publicacao.downloads = int(publicacao_json['downloads'])
        publicacao.url = publicacao_json['url']
        return publicacao

def main():
    importador = ImportadorTesesUsp()
    importador.importar()


