# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse

class AvitoSpider(scrapy.Spider):
    name = 'avito'
    allowed_domains = ['avito.ru']
    start_urls = ['https://www.avito.ru/nizhniy_novgorod/kvartiry/prodam?p=1&cd=1']

    def parse(self, response:HtmlResponse):
        page_all = int(response.css('.js-pages .pagination-root-2oCjZ ::text').extract()[-2])
        for page in range(1, page_all):
            next_page = 'https://www.avito.ru/nizhniy_novgorod/kvartiry/prodam?p=' + str(page) + '&cd=1'
            yield response.follow(next_page, callback=self.parse())
            kv_name = response.css('.item_table-wrapper .snippet-link ::attr(title)').extract()
            for name in kv_name:
                yield response.follow(name, callback=self.name_kv_parse())

    def name_kv_parse(self, response:HtmlResponse):
        kv_name = response.css('.item_table-wrapper .snippet-link ::attr(title)').extract()
        kv_link = 'https://www.avito.ru' + response.css('.item_table-wrapper .snippet-link ::attr(href)').extract()
        kv_price = (response.css('.item_table-wrapper .price ::text').extract()[0]).strip()
        kv_address = (response.css('div.address .item-address__string ::text').extract()).strip()

        yield {'name': kv_name,
               'link': kv_link,
                'price': kv_price,
                'address': kv_address,
                }
