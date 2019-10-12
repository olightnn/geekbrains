-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”
-- Работаем с БД vk и тестовыми данными, которые вы сгенерировали ранее:
-- 1.	Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки 
-- и/или улучшения (JOIN пока не применять).
-- Посмотрел, но пока больших идей по улучшению не придумал.

-- 2.	Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
Как вычислить данный запрос не догадался.
 

-- 3.	Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
SELECT COUNT(id) FROM LIKES WHERE user_id IN 
	(SELECT * FROM 
		(SELECT id FROM profiles ORDER BY birthday DESC LIMIT 10) as blim);


-- 4.	Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT if
	((SELECT COUNT(id) FROM LIKES WHERE user_id IN 
		(SELECT id FROM profiles WHERE gender="m")) 
	> 
	(SELECT COUNT(id) FROM LIKES WHERE user_id IN 
		(SELECT id FROM profiles WHERE gender="f")), 
   'male', 'female');
  

-- 5.	Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- Под активностью решил рассмотреть три вида: лайки, медиа и группы, в которых состоит. Можно также 
-- суммировать эти активности, но не делал такое.
SELECT user_id, COUNT(*) AS count
FROM likes
GROUP BY user_id
ORDER BY count LIMIT 10;

SELECT user_id, COUNT(*) AS count
FROM media
GROUP BY user_id
ORDER BY count LIMIT 10;

SELECT user_id, COUNT(*) AS count
FROM users_communities
GROUP BY user_id
ORDER BY count LIMIT 10;