CREATE TABLE user_cog
SELECT id_user, DATE_FORMAT(MIN(o_date), "%y%m") AS date, o_date
  FROM orders_all WHERE (YEAR(o_date) BETWEEN 2016 AND 2017) AND (price BETWEEN 1 AND 1679000) 
   GROUP BY id_user;

SELECT uc.date, DATE_FORMAT(oa.o_date, "%y%m"), SUM(oa.price) AS oa_price
  FROM orders_all oa
   JOIN user_cog uc
   ON oa.id_user = uc.id_user
   WHERE (YEAR(oa.o_date) BETWEEN 2016 AND 2017) AND (oa.price BETWEEN 1 AND 1679000)
   GROUP BY uc.date, DATE_FORMAT(oa.o_date, "%y%m");
