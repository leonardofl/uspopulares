from django.test import TestCase
from importador import importador_teses_usp
import json
import os

MODULE_DIR = os.path.abspath(os.path.dirname(__file__))

def publicacoes_json():
    publicacoes_for_test = os.path.join(MODULE_DIR, 'publicacoes-for-test.json')
    with open(publicacoes_for_test) as data_file:    
        publicacoes_json = json.load(data_file)               
    return publicacoes_json

class PublicaoJsonParserTests(TestCase):

    def test_parse(self):
        parser = importador_teses_usp.PublicaoJsonParser()
        publicacao_json = publicacoes_json()[0]
        publicacao = parser.parse(publicacao_json)
        self.assertEqual(publicacao.titulo, 'Efeitos do discurso da rede eletrônica no livro didático de Língua Portuguesa')
#            self.assertEqual(publicacao.tipo, '')
        self.assertEqual(publicacao.autor, 'Jacqueline Meireles Ronconi')
        self.assertEqual(publicacao.unidade, 'FFCLRP')
        self.assertEqual(publicacao.area_conhecimento, 'Educação')
#            self.assertEqual(publicacao.data_defesa, '')
        self.assertEqual(publicacao.ano_publicacao, 2015)
        self.assertEqual(publicacao.orientador, 'Pacifico, Soraya Maria Romano')
#            self.assertEqual(publicacao.banca, '')
#            self.assertEqual(publicacao.palavras_chaves, '')
        self.assertEqual(publicacao.visitas, 44)
        self.assertEqual(publicacao.downloads, 21)
        self.assertEqual(publicacao.url, 'http://www.teses.usp.br/teses/disponiveis/59/59140/tde-31072015-115636/pt-br.php')

    def test_parse_unidade_com_sigla_desconhecida(self):
        parser = importador_teses_usp.PublicaoJsonParser()
        publicacao_json = publicacoes_json()[0]
        nome_unidade = 'Unidade desconhecida'
        publicacao_json['unidade'] = nome_unidade
        parser = importador_teses_usp.PublicaoJsonParser()
        publicacao = parser.parse(publicacao_json)
        self.assertEqual(publicacao.unidade, nome_unidade)



