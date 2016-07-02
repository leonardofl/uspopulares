from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from api import models

def publicacoes(request):
    publicacoes = models.Publicacao.objects.all()
    titulos = [ p.titulo for p in publicacoes ]
    resposta = '</br>'.join(titulos)
    return HttpResponse(resposta)

def publicacao(request, publicacao_id):
    publicacao = get_object_or_404(models.Publicacao, id=publicacao_id)
    resposta = '%s</br>%s' % (publicacao.autor, publicacao.titulo)
    return HttpResponse(resposta)

