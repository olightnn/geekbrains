#сформированный запрос для поиска RFM
SELECT tabl_01.id_user, 
  CASE WHEN tabl_01.sum_price_01 < 910 THEN "1"
       WHEN tabl_01.sum_price_01 >= 910 AND tabl_01.sum_price_01 < 1967 THEN "2"
  ELSE "3" end AS rfm_M,
  CASE WHEN TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) < 165 THEN "3"
       WHEN TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) >= 165 AND TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) < 412 THEN "2"
  ELSE "1" end AS rfm_R,
   CASE WHEN tabl_01.id_ord_01 < 2 THEN "1"
        WHEN tabl_01.id_ord_01 >= 2 AND tabl_01.id_ord_01 < 5 THEN "2"
   ELSE "3" end AS rfm_F,
  tabl_01.sum_price_01
 FROM (SELECT id_user, COUNT(id_order) AS id_ord_01, SUM(price) AS sum_price_01, (LAST_VALUE(o_date) OVER (ORDER BY o_date)) AS o_date_last from orders_all WHERE (YEAR(o_date) BETWEEN 2017 AND 2018) AND (price BETWEEN 1 AND 1679000) GROUP by id_user) AS tabl_01;

#кол-во пользователей 1 453 107
SELECT DISTINCT id_user FROM orders_all WHERE (YEAR(o_date) BETWEEN 2017 AND 2018) AND (price BETWEEN 1 AND 1679000) GROUP BY id_user;
#товарооборот 6 147 950 172
SELECT SUM(price) FROM orders_all WHERE (YEAR(o_date) BETWEEN 2017 AND 2018) AND (price BETWEEN 1 AND 1679000); 

#сегмент VIP: товарооборот 485 457 524 и кол-во пользователей 22 547
SELECT SUM(tabl_02.sum_price_01), COUNT(tabl_02.id_user) FROM (SELECT tabl_01.id_user, 
  CASE WHEN tabl_01.sum_price_01 < 910 THEN "1"
       WHEN tabl_01.sum_price_01 >= 910 AND tabl_01.sum_price_01 < 1967 THEN "2"
  ELSE "3" end AS rfm_M,
  CASE WHEN TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) < 165 THEN "3"
       WHEN TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) >= 165 AND TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) < 412 THEN "2"
  ELSE "1" end AS rfm_R,
   CASE WHEN tabl_01.id_ord_01 < 2 THEN "1"
        WHEN tabl_01.id_ord_01 >= 2 AND tabl_01.id_ord_01 < 5 THEN "2"
   ELSE "3" end AS rfm_F,
  tabl_01.sum_price_01
 FROM (SELECT id_user, COUNT(id_order) AS id_ord_01, SUM(price) AS sum_price_01, (LAST_VALUE(o_date) OVER (ORDER BY o_date)) AS o_date_last from orders_all WHERE (YEAR(o_date) BETWEEN 2017 AND 2018) AND (price BETWEEN 1 AND 1679000) GROUP by id_user) AS tabl_01) AS tabl_02 
WHERE tabl_02.rfm_M = 3 AND (tabl_02.rfm_R = 3 OR tabl_02.rfm_R = 2) AND tabl_02.rfm_F = 3;

#сегмент LOST: товарооборот 3 107 374 594 и кол-во пользователей 509 755
SELECT SUM(tabl_02.sum_price_01), COUNT(tabl_02.id_user) FROM (SELECT tabl_01.id_user, 
  CASE WHEN tabl_01.sum_price_01 < 910 THEN "1"
       WHEN tabl_01.sum_price_01 >= 910 AND tabl_01.sum_price_01 < 1967 THEN "2"
  ELSE "3" end AS rfm_M,
  CASE WHEN TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) < 165 THEN "3"
       WHEN TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) >= 165 AND TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) < 412 THEN "2"
  ELSE "1" end AS rfm_R,
   CASE WHEN tabl_01.id_ord_01 < 2 THEN "1"
        WHEN tabl_01.id_ord_01 >= 2 AND tabl_01.id_ord_01 < 5 THEN "2"
   ELSE "3" end AS rfm_F,
  tabl_01.sum_price_01
 FROM (SELECT id_user, COUNT(id_order) AS id_ord_01, SUM(price) AS sum_price_01, (LAST_VALUE(o_date) OVER (ORDER BY o_date)) AS o_date_last from orders_all WHERE (YEAR(o_date) BETWEEN 2017 AND 2018) AND (price BETWEEN 1 AND 1679000) GROUP by id_user) AS tabl_01) AS tabl_02 
WHERE tabl_02.rfm_R = 1;

#сегмент REGULAR: товарооборот 2 555 118 054 и кол-во пользователей 920 805
SELECT SUM(tabl_02.sum_price_01), COUNT(tabl_02.id_user) FROM (SELECT tabl_01.id_user, 
  CASE WHEN tabl_01.sum_price_01 < 910 THEN "1"
       WHEN tabl_01.sum_price_01 >= 910 AND tabl_01.sum_price_01 < 1967 THEN "2"
  ELSE "3" end AS rfm_M,
  CASE WHEN TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) < 165 THEN "3"
       WHEN TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) >= 165 AND TIMESTAMPDIFF(DAY,tabl_01.o_date_last,date('2018-12-31')) < 412 THEN "2"
  ELSE "1" end AS rfm_R,
   CASE WHEN tabl_01.id_ord_01 < 2 THEN "1"
        WHEN tabl_01.id_ord_01 >= 2 AND tabl_01.id_ord_01 < 5 THEN "2"
   ELSE "3" end AS rfm_F,
  tabl_01.sum_price_01
 FROM (SELECT id_user, COUNT(id_order) AS id_ord_01, SUM(price) AS sum_price_01, (LAST_VALUE(o_date) OVER (ORDER BY o_date)) AS o_date_last from orders_all WHERE (YEAR(o_date) BETWEEN 2017 AND 2018) AND (price BETWEEN 1 AND 1679000) GROUP by id_user) AS tabl_01) AS tabl_02 
WHERE NOT ((tabl_02.rfm_M = 3 AND (tabl_02.rfm_R = 3 OR tabl_02.rfm_R = 2) AND tabl_02.rfm_F = 3) OR (tabl_02.rfm_R = 1));
