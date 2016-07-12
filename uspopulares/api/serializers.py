from . import models
from rest_framework import serializers


class PublicacaoSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = models.Publicacao
        fields = ('id', 'titulo', 'tipo', 'autor', 'unidade', 'area_conhecimento', 'data_defesa', 'ano_publicacao', 'orientador', 'banca', 'palavras_chaves', 'visitas', 'downloads', 'url')

class PublicacaoResumoSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = models.Publicacao
        fields = ('id', 'titulo', 'tipo', 'autor', 'unidade', 'area_conhecimento', 'ano_publicacao', 'downloads', 'url')


