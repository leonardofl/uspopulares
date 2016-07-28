from django.db import models
import json
import os

MODULE_DIR = os.path.abspath(os.path.dirname(__file__))

class Publicacao(models.Model):

    DISSERTACAO = 'DISSERTACAO'
    TESE = 'TESE'
    LIVRE_DOCENCIA = 'LIVRE_DOCENCIA'
    TIPOS = ((DISSERTACAO, 'Dissertação'), (TESE, 'Tese'), (LIVRE_DOCENCIA, 'Livre docência'))

    titulo = models.TextField()
    tipo = models.TextField(choices=TIPOS)
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




