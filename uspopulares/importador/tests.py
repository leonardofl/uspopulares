from django.test import TestCase
from importador import importador_teses_usp
from datetime import date
from api import models
from mock import Mock
import json
import os

MODULE_DIR = os.path.abspath(os.path.dirname(__file__))

def publicacoes_json():
    publicacoes_for_test = os.path.join(MODULE_DIR, 'publicacoes-for-test.json')
    with open(publicacoes_for_test) as data_file:    
        publicacoes_json = json.load(data_file)               
    return publicacoes_json

def publicacoes_in_future_json():
    publicacoes_for_test = os.path.join(MODULE_DIR, 'publicacoes-in-future-for-test.json')
    with open(publicacoes_for_test) as data_file:    
        publicacoes_json = json.load(data_file)               
    return publicacoes_json


class PublicaoJsonParserTests(TestCase):

    def test_parse(self):
        parser = importador_teses_usp.PublicaoJsonParser()
        publicacao_json = publicacoes_json()[0]
        publicacao = parser.parse(publicacao_json)
        self.assertEqual(publicacao.titulo, 'Efeitos do discurso da rede eletrônica no livro didático de Língua Portuguesa')
        self.assertEqual(publicacao.tipo, models.TipoPublicacao.DISSERTACAO_MESTRADO)
        self.assertEqual(publicacao.autor, 'Jacqueline Meireles Ronconi')
        self.assertEqual(publicacao.unidade, 'FFCLRP')
        self.assertEqual(publicacao.area_conhecimento, 'Educação')
        self.assertEqual(publicacao.data_defesa, date(2015, 7, 3))
        self.assertEqual(publicacao.ano_publicacao, 2015)
        self.assertEqual(publicacao.orientador, 'Pacifico, Soraya Maria Romano')
        self.assertEqual(len(publicacao.banca), 3)
        self.assertEqual(publicacao.banca[0], 'Pacifico, Soraya Maria Romano (Presidente)')        
        self.assertEqual(publicacao.banca[1], 'Patti, Ane Ribeiro')
        self.assertEqual(publicacao.banca[2], 'Sousa, Lucília Maria Abrahão e')
        self.assertEqual(len(publicacao.palavras_chaves), 4)
        self.assertEqual(publicacao.palavras_chaves[0], 'Discurso')        
        self.assertEqual(publicacao.palavras_chaves[1], 'Linguagem')        
        self.assertEqual(publicacao.palavras_chaves[2], 'Livro didático')
        self.assertEqual(publicacao.palavras_chaves[3], 'Rede eletrônica')
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


class ImportadorTesesUspTests(TestCase):

    def test_importar(self):

        json_retriever = importador_teses_usp.PublicacoesJsonRetriever()
        json_retriever.get_json = Mock(side_effect=publicacoes_json)
        importador = importador_teses_usp.ImportadorTesesUsp(json_retriever)

        importador.importar()

        publicacoes = models.Publicacao.objects.all()
        self.assertEqual(4, len(publicacoes))
        autores = [ p.autor for p in publicacoes ]
        self.assertTrue('Jacqueline Meireles Ronconi' in autores)
        self.assertTrue('Érica Mancuso Schaden' in autores)
        self.assertTrue('Ricardo Nogueira Fracon' in autores)
        self.assertTrue('Silvia Helena Libardi' in autores)

    def test_importacao_idempotente(self):

        # importa primeira vez

        json_retriever = importador_teses_usp.PublicacoesJsonRetriever()
        json_retriever.get_json = Mock(side_effect=publicacoes_json)
        importador = importador_teses_usp.ImportadorTesesUsp(json_retriever)

        importador.importar()

        publicacoes = models.Publicacao.objects.all()
        self.assertEqual(4, len(publicacoes))
        tuplas = [ (p.autor, p.visitas, p.downloads) for p in publicacoes ]
        self.assertTrue(('Jacqueline Meireles Ronconi', 44, 21) in tuplas)
        self.assertTrue(('Érica Mancuso Schaden', 37, 27) in tuplas)
        self.assertTrue(('Ricardo Nogueira Fracon', 343, 717) in tuplas)
        self.assertTrue(('Silvia Helena Libardi', 55, 48) in tuplas)

        # importa segunda vez

        json_retriever = importador_teses_usp.PublicacoesJsonRetriever()
        json_retriever.get_json = Mock(side_effect=publicacoes_in_future_json)
        importador = importador_teses_usp.ImportadorTesesUsp(json_retriever)

        importador.importar()

        publicacoes = models.Publicacao.objects.all()
        self.assertEqual(4, len(publicacoes))
        tuplas = [ (p.autor, p.visitas, p.downloads) for p in publicacoes ]
        self.assertTrue(('Jacqueline Meireles Ronconi', 64, 31) in tuplas)
        self.assertTrue(('Érica Mancuso Schaden', 57, 37) in tuplas)
        self.assertTrue(('Ricardo Nogueira Fracon', 363, 727) in tuplas)
        self.assertTrue(('Silvia Helena Libardi', 75, 58) in tuplas)
        




