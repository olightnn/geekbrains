# -*- coding: utf-8 -*-
import scrapy
#from scrapy.loader.processors import MapCompose, TakeFirst


class VkParseItem(scrapy.Item):
    _id = scrapy.Field()
    parent_id = scrapy.Field()
    user_id = scrapy.Field()
    user_name = scrapy.Field()
    user_info = scrapy.Field()
