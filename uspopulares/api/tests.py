from django.test import TestCase
from api import models

class UnidadesUspTests(TestCase):

    def test_get_sigla_existente(self):
        sigla = models.UnidadesUsp.get_sigla_from('Instituto de Matemática e Estatística')
        self.assertEqual(sigla, 'IME')

    def test_get_key_error_quando_sigla_nao_existe(self):
        with self.assertRaises(KeyError):
            models.UnidadesUsp.get_sigla_from('Unidade não existente')


class TipoPublicacaoTests(TestCase):

    def test_get_value_from_display(self):
        self.assertEqual(models.TipoPublicacao.DISSERTACAO_MESTRADO, models.TipoPublicacao.value_from('Dissertação de Mestrado'))
        self.assertEqual(models.TipoPublicacao.TESE_DOUTORADO, models.TipoPublicacao.value_from('Tese de Doutorado'))
        self.assertEqual(models.TipoPublicacao.TESE_LIVRE_DOCENCIA, models.TipoPublicacao.value_from('Tese de Livre Docencia'))

    def test_get_key_error_quando_display_nao_existe(self):
        with self.assertRaises(KeyError):
            models.TipoPublicacao.value_from('tipo de publicação não existente')

