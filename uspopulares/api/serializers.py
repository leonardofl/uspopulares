from . import models
from rest_framework import serializers


class PublicacaoSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = models.Publicacao
        fields = ('id', 'titulo', 'autor', 'unidade', 'url', 'downloads')


