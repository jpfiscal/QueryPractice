-- #1 --
SELECT * FROM analytics WHERE id = 1880;
-- #2 --
SELECT id, app_name
FROM analytics
WHERE last_updated = '2018-08-01';
-- #3 --
SELECT category, COUNT(*) FROM analytics GROUP BY category;
-- #4 --
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;
-- #5 --
SELECT app_name, reviews FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
-- #6 --
SELECT category, AVG(rating) AS "Average Rating" FROM analytics GROUP BY category ORDER BY "Average Rating" DESC;
-- #7 --
SELECT app_name, price, rating FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);
-- #8 --
SELECT app_name, rating
FROM analytics
WHERE min_installs <=50
AND rating is not null;
-- #9 --
SELECT app_name, rating, reviews
FROM analytics
WHERE rating < 3
AND reviews >= 10000;
-- #10 --
SELECT app_name, reviews, price
FROM analytics
WHERE price BETWEEN 0.1 AND 1
ORDER BY reviews DESC
LIMIT 10;
-- #11 --
SELECT app_name
FROM analytics
WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);
-- #12 --
SELECT app_name, price
FROM analytics
ORDER BY price DESC
LIMIT 1;
-- #13 --
SELECT SUM(reviews) FROM analytics;
-- #14 --
SELECT * FROM(
SELECT category, count(*) AS "app_count"
FROM analytics
GROUP BY category) AS "cat_count"
WHERE app_count > 300;
-- #15 --
SELECT app_name, reviews, min_installs, min_installs/reviews AS "proportion"
FROM analytics
WHERE min_installs > 10000
ORDER BY "proportion"
LIMIT 1;