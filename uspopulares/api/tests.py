from django.test import TestCase
from api import models

class UnidadesUspTests(TestCase):

    def test_get_sigla_existente(self):
        sigla = models.UnidadesUsp.get_sigla_from('Instituto de Matemática e Estatística')
        self.assertEqual(sigla, 'IME')

    def test_get_key_error_quando_sigla_nao_existe(self):
        with self.assertRaises(KeyError):
            models.UnidadesUsp.get_sigla_from('Unidade não existente')

