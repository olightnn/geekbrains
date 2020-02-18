# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse
from scrapy.exceptions import CloseSpider
import vk
from vk_parse.items import VkParseItem
import time


def fetch_user_id(vk_api_val, url: str, version):
    try:
        obj = vk_api_val.utils.resolveScreenName(screen_name=url.split('/')[-1], v=version)
        if obj and obj['type'] == 'user':
            return str(obj['object_id'])
        elif url.split('/')[-1][:2] == 'id':
            return url.split('/')[-1][2:]
        elif url.split('/')[-1][:5] == 'write':
            return url.split('/')[-1][5:]
        else:
            return None
    except Exception as e:
        return None


def get_access_status(vk_api_val, uid: str, version):
    try:
        obj = vk_api_val.users.get(user_id=uid, v=version)[0]
    except Exception as e:
        obj = None

    if obj:
        try:
            access_approved = not (obj['deactivated'])
        except Exception as e_1:
            try:
                access_approved = (not (obj['is_closed']) or obj['can_access_closed'])
            except Exception as e_2:
                print(e_2.__class__.__name__)
                access_approved = False

    else:
        access_approved = False
    return access_approved


class VkSpider(scrapy.Spider):
    user1 = 'https://vk.com/id259577877'
    user2 = 'https://vk.com/id14252698'

    name = 'vk'
    allowed_domains = ['vk.com']

    service_access_key = '446c9e04446c9e04446c9e045044078b664446c446c9e04189341b79fc4fa5d3e1be7a6'
    version = 5.103
    fields = ['domain', 'is_closed', 'can_access_closed', 'deactivated']

    session = vk.Session(access_token=service_access_key)
    vk_api = vk.API(session)

    start_urls = [user1]

    user1_id = fetch_user_id(vk_api, user1, version)
    user2_id = fetch_user_id(vk_api, user2, version)

    common_dict = {}
    i = 0
    stop, stop_2 = False, False

    def parse(self, response: HtmlResponse):
        print(f'Начинаем: {time.asctime()}')
        itm = self.vk_api.users.get(user_id=self.user1_id, v=self.version)[0]
        if self.user1_id == self.user2_id:
            self.stop = True
            item = VkParseItem(
                parent_id=None,
                user_id=itm[0]['id'],
                user_name=f'{itm[0]["first_name"]} {itm[0]["last_name"]}',
                user_info=itm[0],
            )
            return (yield item)

        else:
            self.common_dict[f'{self.user1_id}'] = (itm, None)
            yield response.follow(
                self.user1,
                callback=self.user_friends_parse,
            )


    def user_friends_parse(self, response: HtmlResponse):
        if not self.stop:
            uid = fetch_user_id(vk_api_val=self.vk_api, url=response.url, version=self.version)
            if uid and get_access_status(self.vk_api, uid, self.version):
                list_of_friends = self.vk_api.friends.get(user_id=uid, v=self.version, fields=self.fields)['items']
                for itm in list_of_friends:
                    if itm['id'] == int(self.user2_id):
                        self.common_dict[self.user2_id] = (itm, uid)
                        self.stop = True

                    elif self.common_dict.get(f"{itm['id']}") is None:
                        item = (itm, uid)
                        self.common_dict[f'{itm["id"]}'] = item

                        url = f'https://vk.com/{itm["domain"]}'
                        print(f'\rПройдено узлов: {self.i}', end='')
                        self.i += 1
                        yield response.follow(
                            url,
                            callback=self.user_friends_parse,
                        )

                    else:
                        print(f'\rПройдено узлов: {self.i}', end='')
                        self.i += 1

        else:
            if not self.stop_2:
                itm_id = self.user2_id
                route = []
                while True:
                    route.append(self.common_dict[f'{itm_id}'])
                    if itm_id != self.user1_id:
                        itm_id = self.common_dict[f'{itm_id}'][1]
                    else:
                        print(f'\nДлина пути между {self.user1} и {self.user2} равна {len(route)}')
                        break

                while route:
                    itm = route.pop()
                    print(f'id: {itm[0]["id"]}, юзер: {itm[0]["first_name"]} {itm[0]["last_name"]}')
                    item = VkParseItem(
                        parent_id=itm[1],
                        user_id=itm[0]['id'],
                        user_name=f'{itm[0]["first_name"]} {itm[0]["last_name"]}',
                        user_info=itm[0],
                    )
                    yield item
                    if not route:
                        self.stop_2 = True
                        print(f'Данные записаны в БД: {time.asctime()}')
                        raise CloseSpider('Процесс построения закончен')
            else:
                return
        return
