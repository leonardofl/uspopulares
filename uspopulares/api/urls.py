from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^publicacoes/$', views.publicacoes),
    url(r'^publicacoes/(?P<publicacao_id>[0-9]+)/$', views.publicacao),
]
