from . import models
from . import serializers
from rest_framework import viewsets


class PublicacaoViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Publicacao.objects.all().order_by('id')
    serializer_class = serializers.PublicacaoSerializer

