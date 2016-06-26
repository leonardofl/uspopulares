from django.shortcuts import render
from django.http import HttpResponse

def publicacoes(request):
    return HttpResponse("Retornando dados de todas as publicações.")

