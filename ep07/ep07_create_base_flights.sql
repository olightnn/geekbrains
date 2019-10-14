DROP DATABASE IF EXISTS flights_base;
CREATE DATABASE flights_base;
USE flights_base;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    `from` VARCHAR(50),
    `to` VARCHAR(50)
);
INSERT INTO `flights` (`id`, `from`, `to`) VALUES ('1', 'moscow', 'omsk');
INSERT INTO `flights` (`id`, `from`, `to`) VALUES ('2', 'novgorod', 'kazan');
INSERT INTO `flights` (`id`, `from`, `to`) VALUES ('3', 'irkutsk', 'moscow');
INSERT INTO `flights` (`id`, `from`, `to`) VALUES ('4', 'omsk', 'irkutsk');
INSERT INTO `flights` (`id`, `from`, `to`) VALUES ('5', 'moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(50),
    name VARCHAR(50)
	);
INSERT INTO `cities` (`label`, `name`) VALUES ('moscow', 'Москва');
INSERT INTO `cities` (`label`, `name`) VALUES ('irkutsk', 'Иркутск');
INSERT INTO `cities` (`label`, `name`) VALUES ('novgorod', 'Новгород');
INSERT INTO `cities` (`label`, `name`) VALUES ('kazan', 'Казань');
INSERT INTO `cities` (`label`, `name`) VALUES ('omsk', 'Омск');