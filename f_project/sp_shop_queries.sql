-- Получение списка пользователей с положительным балансов

SELECT user_id, balance FROM balance WHERE balance!=0;

-- Получение списка пользователей с машинами в Гараже

SELECT user_id FROM garage WHERE car_brand!='NULL' and car_model!='NULL';

-- Пользователи, у которых нет заказов

SELECT users.id, users.firstname, users.lastname, users.phone, orders.id, orders.user_id 
	FROM users
    	LEFT OUTER JOIN orders
    		ON users.id = orders.user_id
	WHERE orders.id IS NULL;

-- топ 10 самых активных пользователей (больше всего заказов)

SELECT user_id, COUNT(id) AS ord_sum FROM (

	SELECT us.id AS user_id, us.firstname AS fname, us.lastname AS lname, user_ord.id FROM users as us
    	INNER JOIN orders AS user_ord
        	ON us.id = user_ord.user_id
	) AS agg

GROUP BY user_id
ORDER BY ord_sum DESC
LIMIT 10;

-- Список всех групп запчастей с количеством запчастей в них (Отсортирован по убыванию количества запчастей)

SELECT sp_ca.id AS spare_id, COUNT(sp_ca.id) AS total_spare, sp_ca.name FROM spare_catalogs AS sp_ca
	INNER JOIN spare_products AS sp_pr
    	ON sp_ca.id = sp_pr.catalogs_id
	GROUP BY sp_ca.id
	ORDER BY total_spare DESC;

