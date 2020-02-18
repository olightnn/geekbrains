# -*- coding: utf-8 -*-
from pymongo import MongoClient
#import scrapy

mongo_client = MongoClient()


# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html

class VkParsePipeline(object):

    def process_item(self, item, spider):
        database = mongo_client[spider.name]
        collection = database[type(item).__name__]
        collection.insert_one(item)
        return item
