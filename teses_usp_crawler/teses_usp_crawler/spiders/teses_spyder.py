import scrapy
from teses_usp_crawler import items

class TesesSpider(scrapy.Spider):
    name = "teses"
    allowed_domains = ["teses.usp.br"]
    start_urls = [
        "http://www.teses.usp.br/teses/disponiveis/45/45134/tde-20102014-171912/pt-br.php",
    ]

    def parse(self, response):
        publicacao = items.PublicacaoItem()
        publicacao['titulo'] = response.xpath('//input[@name=\'evTitulo\']/@value').extract()
        publicacao['tipo'] = response.xpath('//div[contains(text(), \'Documento\')]/following-sibling::div[1]/a/text()').extract()
        publicacao['autor'] = response.xpath('//div[contains(text(), \'Nome completo\')]/following-sibling::div[1]/text()').extract()
        publicacao['unidade'] = response.xpath('//div[contains(text(), \'Unidade da USP\')]/following-sibling::div[1]/a/text()').extract()
        #publicacao['area_conhecimento'] = 
        publicacao['data_defesa'] = response.xpath('//div[contains(text(), \'Data de Defesa\')]/following-sibling::div[1]/a/text()').extract()
        publicacao['ano_publicacao'] = response.xpath('//div[contains(text(), \'Imprenta\')]/following-sibling::div[1]/text()').re('\d+')
        # publicacao['orientador'] =
        # publicacao['banca'] =
        # publicacao['palavras_chaves'] =
        publicacao['visitas'] = response.xpath('//img[@alt=\'Visitas\']/parent::a/parent::div/following-sibling::div[1]/text()').extract()
        publicacao['downloads'] = response.xpath('//img[@alt=\'Downloads\']/parent::a/parent::div/following-sibling::div[1]/text()').extract()
        publicacao['url'] = response.url
        yield publicacao

