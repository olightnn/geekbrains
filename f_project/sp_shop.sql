-- Данная база данных представляет собой модель интернет-магазина автомобильных запчастей

CREATE DATABASE IF NOT EXISTS sp_shop;
USE sp_shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(255) COMMENT 'Имя покупателя',
	lastname VARCHAR(255) COMMENT 'Фамилия покупателя',
	phone BIGINT,
	email VARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
    INDEX users_phone_idx(phone),
    INDEX users_name_idx(firstname, lastname)
) COMMENT = 'База пользователей' ;

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id SERIAL PRIMARY KEY,
	login VARCHAR(100) NOT NULL UNIQUE,
	gender CHAR(1),
    birthday DATE COMMENT 'Дата рождения',
    hometown VARCHAR(100),
	discount DECIMAL(2.0) COMMENT 'Величина скидки',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
	INDEX index_of_user_id(user_id),
	INDEX index_of_login(login),	
	FOREIGN KEY (user_id) REFERENCES users(id)
    	ON UPDATE CASCADE
    	ON DELETE RESTRICT
) COMMENT = 'Профили пользователей' ;

DROP TABLE IF EXISTS spare_catalogs;
CREATE TABLE spare_catalogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название раздела',
	UNIQUE (name)
) COMMENT = 'Разделы интернет-магазина (пример, "запчасти для ТО", "двигатель" и т.д.)';

DROP TABLE IF EXISTS spare_products;
CREATE TABLE spare_products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название запчасти',
	description TEXT COMMENT 'Краткое описание',
	price DECIMAL (6,2) COMMENT 'Стоимость запчасти',
	catalogs_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
	INDEX index_of_catalog_id (catalogs_id),
	FOREIGN KEY (catalogs_id) REFERENCES spare_catalogs(id)
) COMMENT = 'Запчасти каталога';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
	INDEX index_of_user_id(user_id),
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Заказы пользователей';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
	id SERIAL PRIMARY KEY,
	order_id BIGINT UNSIGNED,
	product_id BIGINT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
	INDEX index_of_order_id(order_id),
	INDEX index_of_product_id(product_id),
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (product_id) REFERENCES spare_products(id)
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS balance;
CREATE TABLE balance (
	user_id BIGINT UNSIGNED,
	balance DECIMAL(10.2),
	FOREIGN KEY (user_id) REFERENCES users(id)
    	ON UPDATE CASCADE
    	ON DELETE RESTRICT
) COMMENT = 'Баланс пользователей';

DROP TABLE IF EXISTS garage;
CREATE TABLE garage (
	user_id BIGINT UNSIGNED,
	car_brand TEXT COMMENT 'Бренд авто',
	car_model TEXT COMMENT 'Модель авто',
	car_modification TEXT COMMENT 'Модификация авто',
	car_VIN TEXT COMMENT 'ВИН номер авто',
	description TEXT,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
	FOREIGN KEY (user_id) REFERENCES users(id)
    	ON UPDATE CASCADE
    	ON DELETE CASCADE
) COMMENT = 'Гараж авто пользователей';

DROP TABLE IF EXISTS trash;
CREATE TABLE trash (
	user_id BIGINT UNSIGNED,
	product_id BIGINT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество товарных позиций',
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE cascade
	FOREIGN KEY (product_id) REFERENCES spare_products(id)
) COMMENT = 'Корзина';

DROP TABLE IF EXISTS favourites;
CREATE TABLE favourites (
	user_id BIGINT UNSIGNED,
	product_id BIGINT UNSIGNED,
	description TEXT,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE cascade
	FOREIGN KEY (product_id) REFERENCES spare_products(id)
) COMMENT = 'Избранное';

DELIMITER //

-- DROP TRIGGER IF EXISTS user_id_and_product_id_check;
CREATE TRIGGER user_id_and_product_id_check BEFORE INSERT ON favourites FOR EACH ROW
BEGIN
	IF (NEW.user_id IS NULL AND NEW.product_id IS NULL)
    	THEN SIGNAL sqlstate '45000' SET message_text = "Пользователь и товар не могут быть пустыми"; 
	END IF;
END //

CREATE TRIGGER user_id_and_product_id_update BEFORE UPDATE ON favourites FOR EACH ROW
BEGIN
	IF (NEW.user_id IS NULL AND NEW.product_id IS NULL)
    	THEN SIGNAL SQLSTATE '45000' SET message_text = "Пользователь и товар не могут быть пустыми"; 
	END IF;
END; //

DELIMITER ;

DROP TABLE IF EXISTS promo;
CREATE TABLE promo (
	promo_name TEXT,
	product_id BIGINT UNSIGNED,
	description TEXT,
	FOREIGN KEY (product_id) REFERENCES spare_products(id)	
) COMMENT = 'Акции магазина на определённый товар';

-- Представления = название запчасти - название каталога
 CREATE OR REPLACE VIEW view_spare_product AS 
 	SELECT spare_products.name as sp_name, spare_catalogs.name as sc_name 
		FROM spare_products, spare_catalogs 
			WHERE spare_products.catalogs_id = spare_catalogs.id;

-- Представления = заказы покупателя с составом заказа
 CREATE OR REPLACE VIEW view_user_orders AS 
 	SELECT orders.user_id as order_user, orders_products.order_id as order_user_id, orders_products.product_id, spare_products.name
		FROM orders, orders_products, spare_products 
			WHERE orders_products.product_id = spare_products.id;
