from . import models
from . import serializers
from rest_framework import viewsets


class PublicacaoViewSet(viewsets.ReadOnlyModelViewSet):

    queryset = models.Publicacao.objects.all().order_by('id')

    def get_serializer_class(self):
        if self.action == 'list':
            return serializers.PublicacaoResumoSerializer
        if self.action == 'retrieve':
            return serializers.PublicacaoSerializer
        raise RuntimeError('API somente leitura')

