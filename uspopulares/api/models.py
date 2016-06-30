from django.db import models

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
    downlaods = models.IntegerField()

