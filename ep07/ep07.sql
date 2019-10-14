-- Тема “Сложные запросы”
-- 1.	Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
select
	users.id, 
	users.name, 
	count(*) as orders_count
from users, orders 
where users.id = orders.user_id
group by users.name
order by orders_count

-- 2.	Выведите список товаров products и разделов catalogs, который соответствует товару.
select
	products.name as 'Товар', 
	catalogs.name as 'Раздел'
from products, catalogs
where products.catalog_id = catalogs.id

-- 3.	(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights 
-- с русскими названиями городов.
select
	flights.id,
	cities.name as flights_from_rus,
	(select cities.name from cities where cities.label = flights.to) as flights_to_rus
from flights
join cities on flights.from = cities.label
order by flights.id
