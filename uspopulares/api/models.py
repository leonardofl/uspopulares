from django.db import models
import json
import os

MODULE_DIR = os.path.abspath(os.path.dirname(__file__))

class TipoPublicacao:

    DISSERTACAO_MESTRADO = 'DISSERTACAO_METRADO'
    TESE_DOUTORADO = 'TESE_DOUTORADO'
    TESE_LIVRE_DOCENCIA = 'TESE_LIVRE_DOCENCIA'

    choices = ((DISSERTACAO_MESTRADO, 'Dissertação de Mestrado'), 
               (TESE_DOUTORADO, 'Tese de Doutorado'), 
               (TESE_LIVRE_DOCENCIA, 'Tese de Livre Docencia'))

    @staticmethod
    def value_from(display):
        for choice_value, choice_display in TipoPublicacao.choices:
            if choice_display == display:
                return choice_value
        raise KeyError

class Publicacao(models.Model):

    titulo = models.TextField()
    tipo = models.TextField(choices=TipoPublicacao.choices)
    autor = models.TextField()
    unidade = models.TextField()
    area_conhecimento = models.TextField()
    data_defesa = models.DateField()
    ano_publicacao = models.IntegerField()
    orientador = models.TextField()
    banca = models.TextField()
    palavras_chaves = models.TextField()
    visitas = models.IntegerField()
    downloads = models.IntegerField()
    url = models.TextField()


class UnidadesUsp:

    UNIDADES_FILE = os.path.join(MODULE_DIR, 'unidades.json')

    @staticmethod
    def get_sigla_from(nome):
        with open(UnidadesUsp.UNIDADES_FILE) as data_file:    
            siglas = json.load(data_file)
            return siglas[nome]




