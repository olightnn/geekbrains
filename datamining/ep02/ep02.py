import requests
from bs4 import BeautifulSoup

# todo Пройти ленту блога
domain = 'https://geekbrains.ru'
start_url = 'https://geekbrains.ru/posts'

def make_request(url):
    try:
        response = requests.get(url)
        soup = BeautifulSoup(response.text, 'lxml')
        return soup
    except AttributeError:
        pass

def get_page(url):
    soup = make_request(url)
    li = soup.find('ul', attrs={'class': 'gb__pagination'}).find_all('li', attrs={'class': 'page'})
#    next_page_url = li[-1].find('a', attrs={'rel': 'next'}).attrs['href']
    try:
        next_page_url = li[-1].find('a', attrs={'rel': 'next'}).attrs['href']
        return next_page_url
    except AttributeError:
        pass
#    return next_page_url

def pages_all(start_url):
    pages_link = []
    new_page = start_url
    pages_link.append(new_page)
    while True:
        try:
            new_page = domain + get_page(new_page)
            pages_link.append(new_page)
        except TypeError:
            break
    return pages_link

def get_page_link(page_url):
    post_link = []
    for page in pages_all(page_url):
        soup = make_request(page)
        post_page = soup.find('div', attrs={'class': 'post-items-wrapper'}).find_all('a', attrs={'class': 'post-item__title'})
        for link in post_page:
            if post_link != link:
                post_link.append(domain + link['href'])
    return post_link

# todo Зайти на страницу с записью
# todo взять заголовок, url, список тегов и автора
for link in get_page_link(start_url):
    soup = make_request(link)
    name_post = soup.find('h1', attrs={'class': 'blogpost-title text-left text-dark m-t-sm'}).get_text()
    writer = soup.find('div', attrs={'class': 'text-lg text-dark'}).get_text()
    tag_post = soup.find_all('a', attrs={'class': 'small'})
    tag_post_all = []
    for tag_p in tag_post:
        tag_post_all.append(tag_p.get_text())
    print(name_post, ';', link, ';', writer, ';', tag_post_all)

# todo сохранить в базу
