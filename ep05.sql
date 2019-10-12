-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”

-- 1.	Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
UPDATE users SET created_at = now(), updated_at = now();


-- 2.	Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое 
-- время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введённые 
-- ранее значения.
-- SELECT CONVERT(VARCHAR, created_at, 104) 
ALTER TABLE users MODIFY created_at DATETIME not null;
ALTER TABLE users MODIFY updated_at DATETIME not null;


-- 3.	В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар 
-- закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они 
-- выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
SELECT value FROM storehouses_products ORDER BY IF(value=0, ~0, value);


-- 4.	(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде 
-- списка английских названий ('may', 'august')
SELECT * FROM users WHERE DATE_FORMAT(birthday,'%M') in ('may', 'august');

-- 5.	(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
-- Отсортируйте записи в порядке, заданном в списке IN.
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);


-- Практическое задание по теме “Агрегация данных”

-- 1. Подсчитайте средний возраст пользователей в таблице users
SELECT AVG(YEAR(CURRENT_TIMESTAMP) - YEAR(birthday)) FROM profiles;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы 
-- дни недели текущего года, а не года рождения.
SELECT COUNT(*) FROM (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) AS date FROM profiles) AS stats WHERE date=1;
-- date=1 - понедельник, date=2 - вторник и т.д.

-- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы
SELECT EXP(sum(log(value))) FROM table;