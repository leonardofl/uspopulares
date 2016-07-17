# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy

class PublicacaoItem(scrapy.Item):
    titulo = scrapy.Field()
    tipo = scrapy.Field()
    autor = scrapy.Field()
    unidade = scrapy.Field()
    area_conhecimento = scrapy.Field()
    data_defesa = scrapy.Field()
    ano_publicacao = scrapy.Field()
    orientador = scrapy.Field()
    banca = scrapy.Field()
    palavras_chaves = scrapy.Field()
    visitas = scrapy.Field()
    downloads = scrapy.Field()
    url = scrapy.Field()

