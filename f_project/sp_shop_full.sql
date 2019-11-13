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

INSERT INTO users VALUES 
	('1','Jamey','Schultz','1','kayden.runte@example.com','2018-11-13 00:37:28','1990-08-28 04:54:14'),
	('2','Roxane','Muller','577','sauer.vern@example.net','1987-04-01 19:18:31','1999-04-15 07:24:54'),
	('3','Lelah','Gibson','600','mabel78@example.com','1985-11-03 14:40:02','1980-07-09 13:22:03'),
	('4','Louisa','Schroeder','2143054095','viviane50@example.net','1995-05-13 16:22:46','2000-09-22 03:29:01'),
	('5','Asia','Lang','1','koby.lueilwitz@example.org','1993-10-03 21:41:48','1999-12-16 17:30:27'),
	('6','Brook','Koelpin','0','preston41@example.com','2018-05-04 04:49:21','1996-12-18 10:10:57'),
	('7','Dayana','Mraz','1','mckenzie.consuelo@example.com','2007-01-22 20:21:14','1994-12-25 09:55:23'),
	('8','Freida','Williamson','0','crath@example.org','2001-08-31 22:08:30','2014-10-17 19:19:58'),
	('9','Emile','O\'Keefe','17','bwaelchi@example.org','2015-05-25 21:36:42','1975-01-25 16:48:48'),
	('10','Theresa','Nolan','0','belle.anderson@example.com','1994-10-21 03:50:25','1996-02-23 04:47:39'),
	('11','May','Gutkowski','54','emayer@example.com','1993-01-12 03:59:15','1972-06-23 14:19:23'),
	('12','Tate','Cummerata','1','sheridan.zboncak@example.net','2010-03-03 00:35:20','2013-09-09 02:38:35'),
	('13','Kristy','Emard','337','ruecker.cathy@example.org','2002-02-16 15:56:21','1997-05-31 20:44:49'),
	('14','Kali','Conroy','43','dario27@example.net','2003-10-06 11:11:11','1996-01-31 16:01:35'),
	('15','Sheridan','Rippin','0','koss.nayeli@example.com','1983-09-03 11:36:52','1971-06-06 18:37:10'),
	('16','Eusebio','Schuppe','70','rcruickshank@example.com','2017-05-29 02:09:40','1983-03-26 13:26:44'),
	('17','Luciano','West','757164','linda.howe@example.net','2014-08-18 03:43:19','1974-05-10 21:11:21'),
	('18','Jacklyn','Doyle','1','talia77@example.org','2013-11-18 03:30:27','2016-02-29 05:36:45'),
	('19','Grayce','Franecki','1','shea98@example.net','2000-05-19 20:21:07','1975-07-19 11:09:26'),
	('20','Sigrid','Hayes','1','imelda.purdy@example.net','1980-02-01 15:43:56','1976-10-18 18:12:23'),
	('21','Serena','Trantow','1','graham.becker@example.net','2018-05-17 17:05:02','1990-05-24 08:57:57'),
	('22','Kirstin','Deckow','0','tomasa.shanahan@example.org','2006-03-14 02:52:45','2014-10-19 05:56:33'),
	('23','Allan','Hand','11','ariel.kirlin@example.com','1981-07-17 05:29:52','2019-02-19 18:13:59'),
	('24','Ernesto','Johnson','1','gulgowski.autumn@example.org','1999-10-13 17:27:13','2013-10-08 14:59:09'),
	('25','Elfrieda','Leffler','463550','jsimonis@example.org','1998-03-23 14:35:10','2018-09-25 10:42:28'),
	('26','Hillary','Lesch','592','bernhard21@example.com','1986-08-13 09:44:53','1977-06-03 07:35:41'),
	('27','Amaya','Nicolas','0','giuseppe35@example.org','1982-08-25 00:46:21','1982-07-16 23:54:19'),
	('28','Narciso','Hammes','0','keeling.katelynn@example.org','2004-11-15 23:48:05','1994-08-01 01:01:00'),
	('29','Augustus','Cormier','894172','jenifer45@example.org','1991-01-06 12:35:35','1985-09-19 15:45:21'),
	('30','Laura','Morar','374','michelle49@example.net','1996-11-27 00:15:23','1987-10-18 22:41:51'),
	('31','Hollie','Moen','268342','mmueller@example.net','1983-07-08 11:31:24','1995-12-06 09:40:33'),
	('32','Abdiel','Orn','77','raegan.gaylord@example.com','1999-11-26 01:47:57','1995-02-10 04:08:17'),
	('33','Lura','Wolf','0','beahan.agustina@example.net','2008-06-21 17:07:02','2018-01-13 14:37:52'),
	('34','Derrick','Funk','561560','rudy25@example.net','1981-10-27 04:39:35','2008-05-06 13:47:06'),
	('35','Alexandrine','Larson','399761','vada42@example.org','2000-04-13 15:22:22','2000-08-09 23:11:58'),
	('36','Cynthia','Cummerata','0','andrew.schroeder@example.net','2001-10-24 20:28:12','1983-03-09 07:33:52'),
	('37','Bria','Hackett','663222','heidi60@example.org','1981-07-18 08:33:52','1987-02-09 07:45:31'),
	('38','Cristina','Mante','718','loy91@example.net','2011-12-22 03:43:56','2000-08-12 08:33:35'),
	('39','Damien','Stehr','3391110832','kristofer02@example.org','2003-04-25 20:31:06','1981-02-18 13:13:30'),
	('40','Dolores','Langworth','0','delilah.bailey@example.org','1971-11-17 18:21:02','1990-02-26 01:47:55'),
	('41','Tomasa','Abernathy','7920322635','kelvin.harris@example.com','1988-06-12 23:27:02','1999-01-24 20:58:04'),
	('42','Isaiah','Casper','360','corkery.ardella@example.net','2000-02-03 19:11:00','2004-02-28 04:16:38'),
	('43','Delphia','Herzog','0','violet92@example.org','1987-07-05 14:26:04','2000-11-24 21:43:35'),
	('44','Bernita','Trantow','0','irobel@example.org','1972-11-06 00:14:00','1980-06-04 22:31:04'),
	('45','Miracle','Macejkovic','854594','dudley.gleason@example.net','2006-03-04 04:32:49','2016-06-15 16:35:20'),
	('46','Mariane','Sipes','0','olen.king@example.org','1977-12-04 03:31:15','2003-11-27 11:39:33'),
	('47','Gianni','Miller','893','marjory.johnston@example.org','2019-01-17 05:37:20','2010-11-05 00:11:01'),
	('48','Ladarius','Connelly','1','vokuneva@example.net','1971-08-30 06:32:11','2005-01-26 18:59:52'),
	('49','Johnathan','Swaniawski','1','ronny.steuber@example.org','1980-05-06 18:57:37','1983-06-01 06:41:55'),
	('50','Maye','Schaefer','905','ddicki@example.com','1970-03-12 04:13:18','2001-08-03 16:22:42'),
	('51','Aisha','Hettinger','500','rhiannon03@example.org','2012-02-12 05:39:04','1971-04-03 00:14:21'),
	('52','Eveline','Nikolaus','737289','monty.rowe@example.net','1985-03-22 06:17:13','2001-10-07 19:15:53');

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

INSERT INTO profiles VALUES 
	('1','ollie.kerluke','M','2014-08-26','East Isactown','99','1994-12-01 04:05:27','1980-07-19 07:12:03'),
	('2','seffertz','P','2018-12-31','Kuhichaven','99','1979-10-17 22:57:41','1972-03-06 09:31:52'),
	('3','yhayes','M','1980-09-10','Kraighaven','7','1986-12-28 16:08:46','1999-12-09 17:33:16'),
	('4','skylar76','M','2008-05-15','New Bridie','99','2008-10-13 20:55:56','1983-06-05 23:36:41'),
	('5','xmohr','P','2016-11-05','Borerbury','99','1992-01-15 10:46:19','1994-04-13 02:22:01'),
	('6','morissette.carrie','D','2007-06-21','Lake Astrid','99','2015-09-20 13:30:34','2009-10-31 02:30:09'),
	('7','cheaney','M','1977-04-15','Antoniashire','99','2001-08-17 06:33:01','1971-11-25 22:38:14'),
	('8','gianni64','M','2011-10-30','North Jenaland','99','1992-08-31 11:30:58','2001-03-02 09:31:16'),
	('9','kiarra.stokes','M','1991-04-09','Leannonton','6','2005-07-15 21:03:12','1999-11-23 11:12:03'),
	('10','westley13','M','1994-03-27','North Stanley','0','2004-05-19 11:20:48','2002-02-18 17:47:29'),
	('11','hodkiewicz.lelia','M','1994-12-25','Randiberg','58','1991-05-29 21:57:07','2016-06-04 16:17:39'),
	('12','vtremblay','P','1987-09-06','Lake Cristinashire','50','1972-05-01 03:09:32','2009-03-04 05:22:56'),
	('13','doug05','M','1974-04-20','South Rosalia','3','2014-08-28 22:39:48','2005-03-07 08:42:38'),
	('14','larry.fritsch','D','1990-11-04','Beckermouth','34','2008-01-12 15:06:37','2019-06-10 20:24:37'),
	('15','opfannerstill','M','1988-09-29','Osinskimouth','0','2010-01-09 15:54:51','1974-09-22 05:57:05'),
	('16','tressa.murphy','M','2001-12-22','New Jalen','99','1978-07-20 07:52:06','2014-02-08 00:27:18'),
	('17','dolly27','P','2009-04-30','Lake Lane','6','1970-01-25 02:34:34','1985-02-10 07:45:06'),
	('18','linnea.oberbrunner','M','1987-02-23','Lake Caryfurt','99','1993-12-05 22:43:08','2000-07-23 06:24:50'),
	('19','freida.kiehn','M','2008-06-06','Hettingerstad','99','2002-10-13 21:28:00','1988-08-23 02:29:45'),
	('20','cruickshank.marge','M','1999-05-12','East Mariana','8','2013-11-10 05:13:52','1999-09-21 07:03:51'),
	('21','buckridge.kayla','D','2000-04-28','New Elmo','99','1979-05-01 08:02:32','1988-11-14 04:06:29'),
	('22','ogibson','P','2008-11-18','New Bernicebury','99','1997-03-05 17:59:03','1971-01-20 18:46:47'),
	('23','mmitchell','M','1979-10-11','Nolantown','8','1998-04-17 12:56:44','2004-06-28 19:44:18'),
	('24','julius.fritsch','D','1970-07-06','Lake Lucy','99','1981-09-02 01:53:56','1973-06-19 14:28:20'),
	('25','isac58','M','1999-04-12','West Joanieshire','3','2013-01-24 23:28:58','2016-01-26 06:22:10'),
	('26','jose51','P','1973-05-26','East Jolieborough','99','2017-03-07 18:03:35','2003-09-16 04:21:59'),
	('27','walker.freddie','M','1975-12-21','Katelynnview','99','1985-07-29 10:47:24','1975-10-12 22:53:15'),
	('28','constance.cruickshank','M','2013-03-24','Jacksonshire','0','2012-08-12 17:22:37','2007-05-23 06:40:37'),
	('29','korbin05','M','1983-10-26','West Verna','99','1972-01-16 12:51:52','1981-06-03 16:28:43'),
	('30','purdy.wilfrid','D','1974-09-15','East Ignatius','0','2002-10-26 08:05:50','1970-05-28 20:59:56'),
	('31','zmcglynn','M','2008-12-17','Destineechester','99','1976-07-20 11:18:03','1992-04-19 17:03:43'),
	('32','milford24','M','1986-06-08','Bonitafort','99','2009-06-21 16:38:10','2005-05-12 05:46:27'),
	('33','aubree13','M','1971-06-08','East Myraview','99','1990-02-24 13:06:03','1992-01-02 07:43:08'),
	('34','travis69','D','2004-06-07','South Myrtiefort','40','1989-03-20 05:20:36','1994-11-24 15:43:18'),
	('35','zosinski','P','1985-10-19','Adanstad','99','2001-04-05 10:59:56','1997-06-18 22:51:00'),
	('36','wherzog','P','1994-03-11','North Francesco','99','1976-09-05 20:47:54','1970-11-04 15:22:20'),
	('37','krystel.simonis','M','2001-07-14','East Elvie','99','2014-03-13 12:55:42','2003-10-14 00:59:55'),
	('38','estevan.wisozk','P','1972-05-20','Cormierbury','0','1999-01-19 23:58:52','1979-05-19 03:53:57'),
	('39','owalker','P','1978-04-05','Lake Korbinmouth','99','1981-05-13 14:35:47','2014-04-23 02:17:41'),
	('40','dell.weber','D','2018-05-15','East Lucyhaven','7','1976-01-09 01:20:01','1971-02-23 13:07:20'),
	('41','hmiller','M','1977-11-04','Alessandroview','99','2004-11-10 06:00:30','1984-05-17 23:14:01'),
	('42','jwitting','M','2002-07-09','Mitchellland','2','1988-10-16 18:43:59','2011-10-03 16:15:32'),
	('43','dlubowitz','D','1989-12-24','East Colbyview','99','1998-09-18 21:22:18','1983-10-20 01:56:01'),
	('44','drobel','M','1973-06-18','Itzelview','99','1984-12-25 13:02:16','1973-08-08 21:57:13'),
	('45','keira04','D','2009-06-02','Kattieshire','99','2002-12-07 10:58:45','2012-03-07 10:35:13'),
	('46','jgreenholt','M','1974-12-13','Lake Jazmynville','99','2012-08-24 13:13:07','1978-10-25 02:08:04'),
	('47','stamm.angelica','P','2000-09-15','Corwinmouth','99','2017-04-19 05:34:07','2001-03-15 20:03:05'),
	('48','pfeffer.alda','D','1977-09-09','Willamouth','99','1987-04-08 00:01:29','1996-04-03 20:50:46'),
	('49','bartoletti.sven','M','1971-07-15','Fayfort','99','2006-07-30 17:16:58','1990-12-29 23:38:24'),
	('50','ztromp','P','1993-01-11','Port Jean','99','1995-01-20 11:37:19','2006-09-15 04:23:06'),
	('51','freda66','M','2005-01-03','Kassulkeborough','99','1999-09-11 20:46:47','1981-04-13 00:27:47'),
	('52','alford.ferry','D','1990-12-21','North Gregoria','99','2007-05-20 19:29:20','1983-02-18 06:06:50');

DROP TABLE IF EXISTS spare_catalogs;
CREATE TABLE spare_catalogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название раздела',
	UNIQUE (name)
) COMMENT = 'Разделы интернет-магазина (пример, "запчасти для ТО" и т.д.)';

INSERT INTO spare_catalogs VALUES
	(1,"Оригинальные запчасти"),
	(2,"Запчасти для ТО"),
	(3,"Неоригинальные запчасти"),
	(4,"Аксессуары"),
	(5,"Шины и диски"),
	(6,"Масла и технические жидкости"),
	(7,"Автохимия и косметика"),
	(8,"Автопринадлежности"),
	(9, "Инструменты"),
	(10, "Сувенирная продукция");

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

INSERT INTO spare_products VALUES 
	('1','eos','Necessitatibus dicta perferendis quod molestiae sed dolor. Magni debitis fuga similique id aspernatur. Omnis omnis reprehenderit occaecati repellendus aut exercitationem maxime. Consequatur perferendis perspiciatis et delectus.','9999.99','1','1995-08-18 01:30:27','1970-07-25 11:38:39'),
	('2','nihil','Tempore veniam dolorum molestias. Voluptatem rerum ipsa voluptas porro placeat. Asperiores amet ea inventore nemo quos ut in temporibus. Explicabo atque adipisci maxime autem neque. Voluptas hic aut quia.','9999.99','2','2003-12-03 14:23:18','2002-10-02 13:02:04'),
	('3','velit','Modi praesentium repellendus molestiae. Laboriosam pariatur cupiditate optio ea impedit hic. Quis sit non totam eaque officia. Eaque quo quas aspernatur tempora distinctio nemo.','9999.99','3','2001-02-01 22:38:39','1984-03-13 02:46:46'),
	('4','quia','Rem impedit ea voluptates similique accusamus et debitis. Eaque excepturi doloremque quas itaque amet. Distinctio voluptatum accusantium ab odio non omnis.','9999.99','4','1972-12-21 07:51:58','1973-12-06 11:16:31'),
	('5','deleniti','Nam eaque iusto doloribus dolorum et qui tenetur consequuntur. Minus vero nemo quis voluptate quia consequatur. Corrupti voluptas harum omnis amet aspernatur vitae.','9999.99','5','1994-11-04 03:19:30','2014-05-05 21:19:07'),
	('6','eum','Quo optio fuga in vero. Tempora necessitatibus exercitationem illo dolorum similique. Dolor ea possimus sunt. Et consequatur molestiae numquam.','658.40','6','1985-10-25 12:20:33','1996-09-16 19:57:22'),
	('7','accusamus','Perspiciatis soluta quia earum. Numquam et eveniet odit incidunt quam voluptatem nostrum totam. Earum sed dicta temporibus quaerat et deserunt eum. Eveniet soluta aut consequatur perspiciatis molestiae architecto voluptatem.','0.00','7','2011-11-09 12:29:44','2015-10-21 09:20:33'),
	('8','quam','Ut eligendi provident rerum aut dolorem voluptate suscipit non. Architecto quia delectus qui nihil nostrum architecto. Ea culpa nemo ut pariatur.','9999.99','8','1970-11-01 02:43:24','2013-02-06 17:38:35'),
	('9','ipsa','Quasi porro et officiis eum. Sed qui aut quos est et. Et omnis dolor ut. Aliquam et odit saepe iste fuga. Veniam odio aut possimus fuga corporis.','9999.99','9','1998-09-20 02:01:20','1981-01-16 12:45:39'),
	('10','cum','Dolores id id non sint explicabo. Doloremque beatae quod in amet laborum aut. Quae autem porro aspernatur ex tempora consectetur. Aperiam assumenda incidunt aut deserunt hic nulla blanditiis nulla.','293.49','10','2017-05-05 07:13:55','2009-09-22 23:52:17'),
	('11','officiis','Aperiam hic iusto et hic. Consequatur at molestiae id et. Numquam veritatis mollitia fugiat sunt.','0.00','1','1976-02-20 09:23:26','2010-08-12 21:38:28'),
	('12','est','Consequatur laboriosam qui in sit. Fugiat impedit adipisci dolor. Debitis rerum aut id totam dolores sit.','54.33','2','1995-11-18 19:23:08','1997-06-06 00:41:34'),
	('13','quos','Voluptatum odio asperiores asperiores recusandae nemo. Ea tempora quia quis. Ex doloremque eaque voluptates nulla enim hic. Reiciendis et adipisci dolorum modi saepe.','412.10','3','2009-05-26 18:14:13','1999-12-27 15:07:22'),
	('14','perferendis','Amet dolores aspernatur aut blanditiis quas accusamus. Ducimus quibusdam voluptatem consequuntur iusto. Dignissimos ducimus odio iusto non. Quaerat in quo corrupti nostrum sequi a.','9999.99','4','1988-09-11 05:29:57','1992-06-06 17:13:29'),
	('15','labore','Voluptates quod dolore deleniti ab eos corrupti. Voluptatem repudiandae saepe consequatur blanditiis repudiandae adipisci. Occaecati fugiat et alias velit qui at deleniti. Tenetur ullam animi quo est ducimus laboriosam.','9999.99','5','1995-08-04 07:51:58','1978-05-23 06:57:38'),
	('16','vel','Aspernatur qui nam id neque inventore ut fugit. Consequuntur explicabo dolore ea. Tempore qui sint modi nesciunt aut.','907.47','6','1982-07-04 01:45:28','2001-08-12 22:37:57'),
	('17','explicabo','Sint et fuga non nesciunt quos. Officiis necessitatibus est impedit id. Et sequi aut eius dolor nesciunt maiores. Iure id quo dolores necessitatibus.','4.25','7','1996-03-13 10:21:37','2003-07-30 22:37:10'),
	('18','et','Molestiae modi autem a debitis earum aperiam cumque. Quia aspernatur et laboriosam dicta nemo. Accusamus saepe non inventore ut.','0.00','8','1985-09-29 08:50:00','2003-03-28 12:50:58'),
	('19','voluptatem','Quaerat et adipisci esse quaerat qui. Fugit sequi sit quis quas. Sed totam deserunt error.','9999.99','9','2016-12-01 02:39:50','1975-06-17 02:54:03'),
	('20','repudiandae','Quis alias vel dicta quo neque. Dolore nihil consectetur nobis quae suscipit ipsa quo. Culpa nisi ratione omnis. Dolores explicabo dolorum deleniti quia.','0.31','10','1998-06-07 01:32:20','2014-05-17 18:33:21'),
	('21','molestiae','Dicta nam esse id sed. Dolor maiores maxime ipsum error minima. Quibusdam velit quas ea repellat voluptas maxime ab. Aut sed iste et molestiae quae et voluptatem aspernatur.','0.00','1','2016-08-30 12:00:12','2015-02-22 22:04:38'),
	('22','quia','Temporibus iure saepe iste beatae. Optio explicabo vero illum nam iure. Vel nam odio dignissimos ut. Aliquid repellendus neque voluptas dolorem et.','1129.31','2','1972-09-27 10:52:28','1970-10-18 17:21:59'),
	('23','dolores','Impedit distinctio quisquam repudiandae nemo labore molestiae architecto voluptates. Non adipisci porro sed qui. Nemo doloremque atque voluptatem architecto explicabo cum. Quisquam necessitatibus a qui veniam.','1531.46','3','2009-09-30 21:44:34','1987-05-06 15:17:33'),
	('24','non','Autem quaerat voluptatem sed aperiam quia sed. Minus dolor corporis sunt ut earum deserunt consequuntur. Et aliquid incidunt facilis excepturi molestiae quod minima. Modi non rerum ut id facere dolor odio.','4611.00','4','2016-10-29 10:53:58','2000-04-22 05:37:35'),
	('25','perferendis','Commodi non inventore voluptates cupiditate ea quis. Nisi omnis earum explicabo vero blanditiis laudantium odit.','9999.99','5','1986-05-17 15:28:29','2004-08-16 06:08:59'),
	('26','sapiente','Est perferendis debitis rerum consectetur optio sed sint enim. Asperiores cupiditate corporis omnis. Rerum quis a est facere aut iure commodi hic. Alias ipsa sit consequuntur voluptatum distinctio vitae.','9999.99','6','1985-11-11 15:07:42','1974-05-12 03:58:10'),
	('27','veniam','Expedita est dolores nulla dolor fuga magnam. Qui eos nobis odit voluptates sed. Aspernatur et exercitationem et corrupti beatae dolorem qui.','1234.94','7','1973-09-20 11:12:08','1982-12-25 23:50:30'),
	('28','sequi','Eius eos magni sit et quaerat praesentium qui. Libero eum aut incidunt autem sit in. Ut sit facilis vel a vel.','52.31','8','2000-06-22 10:15:41','2001-09-09 15:51:03'),
	('29','fugiat','Voluptatem odit qui eos repudiandae ipsum. Ex quia et odio omnis eum est. Sed quo ipsam autem inventore atque voluptas numquam.','226.09','9','2004-06-05 23:35:50','2016-08-27 06:04:55'),
	('30','ex','Nihil sed debitis sint earum non omnis odit. Asperiores quibusdam soluta quas enim sint rerum nostrum id. Eum qui minima beatae alias enim quia veritatis. Aliquid non sed nobis a perspiciatis est.','9999.99','10','1980-11-23 06:14:38','2019-08-04 04:46:21');

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
	INDEX index_of_user_id(user_id),
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Заказы пользователей';

INSERT INTO orders VALUES 
	('1','1','2007-09-17 20:22:55','1992-09-08 17:58:10'),
	('2','2','2000-03-14 21:05:23','2004-04-27 02:17:47'),
	('3','3','2013-10-09 12:04:28','1990-06-23 13:48:33'),
	('4','4','1989-03-10 17:25:20','2019-05-11 00:12:07'),
	('5','5','2000-10-07 02:37:32','1982-04-19 21:29:00'),
	('6','6','1983-12-18 18:43:34','1984-12-02 22:35:29'),
	('7','7','1970-05-20 16:18:45','2000-08-20 05:11:10'),
	('8','8','2014-04-18 16:47:08','2009-07-05 09:58:45'),
	('9','9','2010-09-19 20:26:54','2017-10-02 21:04:45'),
	('10','10','1989-04-17 06:35:01','2009-11-24 00:04:45'),
	('11','11','1982-11-10 06:21:14','2010-06-20 10:29:54'),
	('12','12','2017-05-25 17:46:13','1993-10-04 04:13:18'),
	('13','13','1970-11-01 17:16:37','1995-12-21 06:04:15'),
	('14','14','1980-03-06 10:00:31','1995-11-21 12:56:23'),
	('15','15','2008-05-09 07:30:45','2000-11-03 00:35:51');

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

INSERT INTO orders_products VALUES 
	('1','1','1','1','1995-04-25 20:14:33','1974-07-22 01:59:22'),
	('2','2','2','1','2014-02-09 16:35:00','2013-09-10 20:30:45'),
	('3','3','3','1','2004-02-08 00:19:53','1994-12-21 01:53:41'),
	('4','4','4','1','1996-07-09 07:57:50','1980-08-24 04:26:18'),
	('5','5','5','1','1983-05-29 16:49:23','1985-06-06 06:54:08'),
	('6','6','6','1','1980-10-13 20:40:34','2006-09-26 13:45:57'),
	('7','7','7','1','2008-05-21 10:38:06','1987-04-18 03:30:37'),
	('8','8','8','1','2015-12-18 13:16:05','1973-03-20 03:35:43'),
	('9','9','9','1','2008-11-21 00:21:22','1991-08-04 10:57:31'),
	('10','10','10','1','1971-05-26 16:41:40','1999-08-22 18:25:49'),
	('11','11','11','1','2002-09-08 17:05:40','1990-05-23 16:56:19'),
	('12','12','12','1','2013-02-18 19:51:46','2006-08-12 14:07:15'),
	('13','13','13','1','2005-06-17 18:49:03','1982-06-22 20:39:01'),
	('14','14','14','1','1981-06-05 16:24:54','1988-10-04 13:25:47'),
	('15','15','15','1','2017-12-20 23:57:05','2017-02-13 14:27:41');

DROP TABLE IF EXISTS balance;
CREATE TABLE balance (
	user_id BIGINT UNSIGNED,
	balance DECIMAL(10.2),
	FOREIGN KEY (user_id) REFERENCES users(id)
    	ON UPDATE CASCADE
    	ON DELETE RESTRICT
) COMMENT = 'Баланс пользователей';

INSERT INTO balance VALUES 
	('1','2'),
	('2','6'),
	('3','1'),
	('4','3'),
	('5','8'),
	('6','6'),
	('7','1'),
	('8','6'),
	('9','3'),
	('10','7'),
	('11','8'),
	('12','8'),
	('13','4'),
	('14','6'),
	('15','6'),
	('16','7'),
	('17','7'),
	('18','0'),
	('19','8'),
	('20','3'),
	('21','8'),
	('22','5'),
	('23','3'),
	('24','6'),
	('25','6'),
	('26','0'),
	('27','1'),
	('28','7'),
	('29','0'),
	('30','0'),
	('31','7'),
	('32','4'),
	('33','9'),
	('34','9'),
	('35','2'),
	('36','0'),
	('37','8'),
	('38','1'),
	('39','0'),
	('40','9');

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

INSERT INTO garage VALUES 
	('1',"Toyota","Rav4",NULL,NULL,'Possimus et ut magnam cupiditate. Consectetur suscipit consequuntur consequatur quos architecto ipsum velit et. Esse sit magni placeat eum tempora ea molestiae. Reiciendis in minus hic eligendi autem mollitia maiores.','1977-09-01 15:16:55','2006-12-05 19:17:00'),
	('2',"Toyota","Rav4",NULL,NULL,'Aut doloremque et commodi. Iusto nulla aut porro molestias distinctio repellat aut. Explicabo nihil deleniti et non ut perspiciatis error.','2006-05-16 05:57:48','1991-07-15 23:01:56'),
	('3',"Toyota","Rav4",NULL,NULL,'Tenetur in aperiam saepe dignissimos dolore alias eaque. Consequatur sint molestias ut vitae sed dolor. Accusantium in laudantium amet ipsam architecto. Quae aliquid ratione voluptate dolor.','2017-09-29 13:19:01','1988-07-21 21:51:09'),
	('4',"Ford","Focus",NULL,NULL,'Magnam et maxime nihil et et. Ullam consequatur facere autem. Ut recusandae eum et cum non veniam quae. Provident dolore quasi ducimus nobis qui magnam ut et.','1996-07-23 21:03:26','2003-02-02 23:47:42'),
	('5',"Ford","Focus RS",NULL,NULL,'Expedita non facilis praesentium veritatis repellat. Commodi fugit placeat magnam. Et nihil voluptatem voluptates dolor repudiandae.','1985-09-12 06:37:35','1988-05-11 07:43:48'),
	('6',"Ford","Focus",NULL,NULL,'Error ipsam id eos quidem inventore omnis. Ea quis sit sed aut. Iusto officiis dolores eum sed id odit.','1971-07-17 17:41:01','1985-08-29 15:06:25'),
	('7',"Ford","Escape",NULL,NULL,'Explicabo quis officia modi quia voluptatem molestias. Consequatur et non at consequatur et. Rem corrupti aspernatur ab et. Aut quibusdam dolores qui omnis eum. Mollitia laboriosam nihil modi aut.','2010-06-25 15:41:55','2005-08-13 11:35:55'),
	('8',"VW","Jetta",NULL,NULL,'Impedit eius et ipsam ea odio. Officiis nihil incidunt minima qui quam assumenda. Dolorem blanditiis sit numquam ad et. Quia quo qui a optio molestias nulla.','2011-03-06 17:51:42','1978-08-20 10:33:15'),
	('9',NULL,NULL,NULL,NULL,'Provident soluta qui soluta quisquam dolor. Veritatis quia sequi consequuntur sit. Quos sit dolorem iure voluptas velit et laborum nisi. Excepturi necessitatibus mollitia laborum voluptatum.','1991-10-13 21:01:48','1982-08-01 00:30:23'),
	('10',NULL,NULL,NULL,NULL,'Ea ea ut ea recusandae. Non qui molestiae ut at pariatur. Molestiae saepe nesciunt vel dolores est.','1991-11-26 18:30:53','1993-03-13 00:51:05'),
	('11',NULL,NULL,NULL,NULL,'Consectetur magni cupiditate et non qui. Tenetur nihil sed non vel non. Perferendis quasi earum quia cumque explicabo. Repellendus corporis voluptas tempore ut.','2008-07-26 08:20:22','2018-07-11 10:59:38'),
	('12',NULL,NULL,NULL,NULL,'Omnis eos nulla modi et. Eligendi est qui corrupti facere adipisci cum sunt. Officiis vel officiis repellat rerum aperiam. Minima ipsum voluptatem architecto iure.','1979-10-17 11:18:47','2017-03-26 02:07:22'),
	('13',NULL,NULL,NULL,NULL,'Omnis deserunt quo repellendus quis porro velit. Corrupti voluptatem aut sapiente nesciunt culpa harum sint dolorem. Distinctio et et eum placeat repellat natus deserunt.','2013-12-17 11:23:17','1985-03-03 04:02:46'),
	('14',NULL,NULL,NULL,NULL,'Dolores dolorum et ut pariatur corporis repellendus impedit. Ipsa et officiis nulla porro sint maxime sequi. Ut fugit sed dolor voluptatum sint suscipit voluptatem. Ipsa ut mollitia officia eaque corrupti voluptate.','1990-08-07 21:59:51','2008-10-30 15:03:44'),
	('15',NULL,NULL,NULL,NULL,'Incidunt voluptatem nesciunt voluptas et. Esse quod ex cupiditate sed nesciunt id beatae. Officia earum consectetur et ipsum earum. Quaerat unde nihil et aliquid in id.','1976-06-11 13:21:39','2006-01-15 07:39:03'),
	('16',NULL,NULL,NULL,NULL,'Ea alias vel ex sit atque. Inventore voluptatibus natus pariatur et accusamus non. Totam dolor voluptatem sint dolor accusamus.','2016-08-29 05:45:42','2002-05-01 02:30:28'),
	('17',"VW","Jetta",NULL,NULL,'Reprehenderit et quidem quisquam voluptates atque molestiae hic. Quo illum voluptatem sint aut sint. Aliquam molestias voluptatem et ut nostrum nihil adipisci. Magni vero molestiae deleniti quo reiciendis.','1970-04-16 13:49:32','2008-03-09 13:09:07'),
	('18',NULL,NULL,NULL,NULL,'Consectetur et illum et omnis. Sunt nihil explicabo occaecati praesentium et harum a. Nihil aliquid sint facilis cum harum.','1972-08-31 11:23:26','1972-10-29 02:56:15'),
	('19',NULL,NULL,NULL,NULL,'Amet iste sed nihil soluta ducimus tenetur. Voluptatem dolores eos tempora dolores deserunt sit sed. Odio pariatur rerum vel sit vel. Voluptatibus tenetur perferendis cumque autem enim temporibus.','2012-11-11 17:21:29','2012-04-05 18:49:05'),
	('20',NULL,NULL,NULL,NULL,'Exercitationem qui nihil sed voluptatem inventore praesentium quod id. Quis fuga incidunt quia similique quas sit omnis. Fugiat sunt perspiciatis rerum tenetur voluptatem quidem qui. Corrupti magnam vel porro ut error a.','1996-01-28 11:06:30','2014-05-08 02:02:18'),
	('21',NULL,NULL,NULL,NULL,'Delectus consequatur vel facere ad similique voluptas. Minima asperiores enim et sunt in ut quae autem. Voluptates ut pariatur quisquam magnam qui pariatur quidem. Voluptas ut illo quo voluptatibus ipsam qui consequatur.','1999-05-04 21:40:55','1980-04-17 16:00:38'),
	('22',NULL,NULL,NULL,NULL,'Atque at reiciendis numquam eaque quibusdam eum enim ab. Aperiam ea sint ea rerum minima est. Tempore incidunt necessitatibus eos soluta sunt soluta. Sint et dolores reiciendis nihil.','2017-11-28 04:27:16','2000-05-05 09:59:54'),
	('23',NULL,NULL,NULL,NULL,'Fuga fugiat impedit et voluptatem aut omnis ullam itaque. Rerum quo nesciunt non modi. Et excepturi perspiciatis repudiandae quia nihil eaque. Possimus consectetur rem ut.','2007-04-09 00:00:15','2004-02-28 07:30:46'),
	('24',NULL,NULL,NULL,NULL,'Omnis ratione recusandae expedita. Tenetur veniam eius necessitatibus nobis voluptates ut ut. Aut consequatur nihil neque aut veritatis autem consequatur. Ab ut et nihil aut vitae cupiditate magnam.','1985-07-16 14:18:55','2019-10-10 02:04:17'),
	('25',"VW","Jetta",NULL,NULL,'Voluptatum in deleniti natus. Soluta ducimus et aspernatur voluptas vero. Velit quia natus aliquid quos reprehenderit nobis.','1990-05-19 15:46:52','1985-03-22 04:01:12'),
	('26',NULL,NULL,NULL,NULL,'Impedit occaecati similique est est nulla. Dolorem ut excepturi ullam voluptate.','1980-02-12 09:16:16','2009-11-23 16:12:42'),
	('27',NULL,NULL,NULL,NULL,'Facere nihil sapiente ut deserunt veniam sint reprehenderit. Expedita in illo facilis praesentium reiciendis est. Distinctio quaerat ex odio aut illo totam. Omnis ipsam voluptate qui amet id sed recusandae est. Doloremque numquam et quo iste.','2006-08-07 08:03:34','1985-10-07 15:28:22'),
	('28',NULL,NULL,NULL,NULL,'Ipsam voluptatum aliquid eos nemo iusto vel. Quo possimus ea quaerat sunt incidunt est voluptas quibusdam. Perspiciatis sit ducimus totam cum.','1984-08-18 01:08:49','1985-04-11 03:30:21'),
	('29',NULL,NULL,NULL,NULL,'Eveniet quas dolor nesciunt ratione voluptatem fugiat. Qui doloribus necessitatibus iure et facere quia. Nostrum dolorem molestias eligendi harum iure est magnam ad. Inventore qui illum sit.','1999-01-11 05:28:20','1990-11-03 01:05:29'),
	('30',NULL,NULL,NULL,NULL,'Aliquam minima qui vitae unde quidem velit. Beatae magnam hic aut et labore enim repudiandae. Cupiditate quasi enim enim omnis labore consequatur.','1983-08-19 07:12:21','1998-05-02 04:22:18'),
	('31',NULL,NULL,NULL,NULL,'Cumque quidem nisi voluptatem quaerat animi dolorum. Vitae autem omnis maxime magni vitae architecto vel. Quas odio iure odit iure laboriosam.','2000-09-06 14:03:21','2010-07-02 03:52:54'),
	('32',NULL,NULL,NULL,NULL,'Est voluptates et iure sint et. Aliquid tempore perferendis recusandae expedita rerum beatae natus. Pariatur ut assumenda eos quo est quis. Ut fugiat dignissimos dolor facere a.','2010-08-04 10:33:40','2019-01-21 12:28:10'),
	('33',NULL,NULL,NULL,NULL,'Consectetur non aut ea repudiandae. Eos eos ullam dolore autem illo.','1971-09-24 11:41:23','1984-07-31 09:42:48'),
	('34',NULL,NULL,NULL,NULL,'Est autem in ut eveniet dolor. Atque et earum natus sed. Quidem sequi ab sit odio rerum numquam. Qui et minima eaque. Et labore illum tempora.','2008-11-13 01:56:15','2004-12-26 13:00:24'),
	('35',NULL,NULL,NULL,NULL,'Hic enim quae in voluptatem. Et omnis ipsa consequatur velit. Eveniet ut et nemo corporis quo et quia.','1991-03-05 12:07:39','1998-05-10 08:20:33'),
	('36',NULL,NULL,NULL,NULL,'Accusantium consequuntur ut qui sint. Et eveniet optio est et eveniet quas ut. Neque consequatur cum et quam fugit eos unde ut.','2018-11-14 01:22:33','1988-09-26 07:56:15'),
	('37',NULL,NULL,NULL,NULL,'Consectetur minus qui consequatur recusandae et. In impedit qui officia.','1985-06-21 01:39:24','2000-10-20 19:36:03'),
	('38',NULL,NULL,NULL,NULL,'Aut sint ut nesciunt ea. Ut doloribus est laboriosam voluptatem. Amet aperiam et velit libero consequatur est et. Laudantium voluptatum facilis voluptatem voluptate maxime.','1995-02-19 13:49:24','2013-07-31 22:04:20'),
	('39',NULL,NULL,NULL,NULL,'Iste magni et non maiores. Maxime et aut necessitatibus. Reiciendis libero tempore magnam esse. Voluptas dignissimos recusandae voluptatem accusantium eveniet aut nostrum.','2014-03-17 23:03:10','1984-06-24 12:29:57'),
	('40',NULL,NULL,NULL,NULL,'Perspiciatis culpa est facilis laudantium sunt. Est maiores quis facere nesciunt. Consequatur suscipit quibusdam ex labore. Quo quia est molestiae qui.','2005-04-15 17:03:49','2012-01-25 00:15:35');


DROP TABLE IF EXISTS trash;
CREATE TABLE trash (
	user_id BIGINT UNSIGNED,
	product_id BIGINT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество товарных позиций',
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE cascade,
	FOREIGN KEY (product_id) REFERENCES spare_products(id)
) COMMENT = 'Корзина';

DROP TABLE IF EXISTS favourites;
CREATE TABLE favourites (
	user_id BIGINT UNSIGNED,
	product_id BIGINT UNSIGNED,
	description TEXT,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE cascade,
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
	price DECIMAL (6,2),
	description TEXT,
	FOREIGN KEY (product_id) REFERENCES spare_products(id)	
) COMMENT = 'Акции магазина на определённый товар';

INSERT INTO promo VALUES
	("Скидка на товар", 25, 25.25, "Конечная цена"),
	("Скидка на товар", 30, 35.50, "Конечная цена");

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
