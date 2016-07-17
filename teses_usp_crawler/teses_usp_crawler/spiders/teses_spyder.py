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
        publicacao['titulo'] = response.xpath('//input[@name=\'evTitulo\']/@value').extract()[0]
        publicacao['tipo'] = response.xpath('//div[contains(text(), \'Documento\')]/following-sibling::div[1]/a/text()').extract()[0]
        publicacao['autor'] = response.xpath('//div[contains(text(), \'Nome completo\')]/following-sibling::div[1]/text()').extract()[0]
        publicacao['unidade'] = response.xpath('//div[contains(text(), \'Unidade da USP\')]/following-sibling::div[1]/a/text()').extract()[0]
        publicacao['area_conhecimento'] = response.xpath('//div[contains(text(), \'Área do Conhecimento\')]/following-sibling::div[1]/a/text()').extract()[0]
        publicacao['data_defesa'] = response.xpath('//div[contains(text(), \'Data de Defesa\')]/following-sibling::div[1]/a/text()').extract()[0]
        publicacao['ano_publicacao'] = response.xpath('//div[contains(text(), \'Imprenta\')]/following-sibling::div[1]/text()').re('\d+')[0]
        publicacao['orientador'] = response.xpath('//meta[@name=\'DC.contributor\']/@content').extract()[0]
        banca = response.xpath('//div[contains(text(), \'Banca examinadora\')]/following-sibling::div[1]/text()').extract()
        banca = [b.replace('\n', '') for b in banca]
        banca.remove('')
        publicacao['banca'] = banca
        palavras_chaves = response.xpath('//div[contains(text(), \'Palavras-chave em português\')]/following-sibling::div[1]/text()').extract()
        palavras_chaves = [p.replace('\n', '') for p in palavras_chaves]
        palavras_chaves.remove('')
        publicacao['palavras_chaves'] = palavras_chaves
        publicacao['visitas'] = response.xpath('//img[@alt=\'Visitas\']/parent::a/parent::div/following-sibling::div[1]/text()').extract()[0]
        publicacao['downloads'] = response.xpath('//img[@alt=\'Downloads\']/parent::a/parent::div/following-sibling::div[1]/text()').extract()[0]
        publicacao['url'] = response.url
        yield publicacao

