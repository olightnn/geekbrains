#Заданий 1
import requests
import json

url = 'https://api.github.com/users/octocat/repos' #url конкретного пользователя
p = requests.get(url).json()

#Выводим на экран список репозиториев для конкретного пользователя
for repo in p:
    print(repo['html_url'])

#Сохранение json вывода
with open('repo.txt', 'w', encoding='utf-8') as f:
    json.dump(repo, f, ensure_ascii=False)

#Заданий 3
import requests
import json
import time
import re

headers = {
    'User-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko)',
}
params = {'records_per_page': 20, 'page': 1}

api_url_category = 'https://5ka.ru/api/v2/categories/'
#api_url = 'https://5ka.ru/api/v2/special_offers/'

class CategoryObj:
    def __init__(self, **kwargs):
        for key, value in kwargs.items():
            setattr(self, key, value)

def get_data(url: str, params: dict) -> dict:
    while True:
        time.sleep(1)
        response = requests.get(url, headers=headers, params=params)
        if response.status_code == 200:
            break
    return response.json()

url = 'https://5ka.ru/api/v2/special_offers/'
results = []

resp_categories = requests.get(api_url_category).json()

for code in resp_categories:
    link_temp = code.get('parent_group_name')
    link_temp_n = re.sub('[\*\n\"]', '', link_temp)
    with open(link_temp_n+'.txt', 'w', encoding='utf-8') as f:
        json.dump(requests.get(url+'?categories='+code.get('parent_group_code')).json()['results'], f, ensure_ascii=False)

#while url:
#    response = get_data(url, params)
#    results.extend(response['results'])
#    url = response['next']
#    params = {}
#print(1)
