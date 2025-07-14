-- What is a Subquery

/*In SQL a subquery is a query within another query.it is a SELECT statement
that is nested inside another SELECT, INSERT, UPDATE, or DELETE statement.
the subquery is executed first, and its result is then used as a parameter
or condition for the outer query.

Note - THe topic is slightly difficult and needs a lot of practice

Example - Find the movie with highest ranting


*/

SELECT MAX(score) FROM datascience.movies


SELECT * FROM datascience.movies
WHERE score = 9.3

SELECT * FROM datascience.movies
WHERE score = (SELECT MAX(score) FROM datascience.movies)

/* ==========Types of Subqueries=========

based on 

1. the result in return.
2. based on working 

1.Return data 

Scalar Subquery 
Row Subquery
Table Subquery

2. Working (execution)

Independent subquery
correlated subquery

*/

-- where can subqueries be used?

INSERT -> SELECT  -> UPDATE -> Delete

SELECT > WHERE > SELECT > FROM > HAVING


-- # ===============Independent Subquery - Scalar Subquery ============


-- 1. Find the movie with highest profit(vs order by)


USE datascience;
SELECT * FROM movies
WHERE (gross - budget) = (SELECT MAX(gross - budget) FROM movies);


-- second way(order by ) order by used the concept indexing--

SELECT * FROM movies
ORDER BY (gross - budget) DESC LIMIT 1


-- 2. Find how many movies have a rating  > the avg of all the movie ratings
-- ( find the count of above average movies )


SELECT * FROM movies 
WHERE score > (SELECT AVG(score) FROM movies)


SELECT COUNT(*) FROM movies 
WHERE score > (SELECT AVG(score) FROM movies)

-- 3. Find the higest rated movie of 2000

SELECT * FROM movies WHERE year = 2000 AND score = (SELECT MAX(score) FROM movies
WHERE year = 2000)


-- 4. Find the higest rated movie among all movies whose number of votes are > the dataset avg votes

SELECT * FROM movies
WHERE votes > (SELECT AVG (votes) FROM movies)


SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM movies
WHERE votes > (SELECT AVG (votes) FROM movies))


-- # ===============Independent Subquery - Row Subquery ( One Col Multi Rows ) ============

-- # 1. Find all users who never ordered


USE Datascience;
SELECT * FROM users2 WHERE user_id NOT IN (SELECT DISTINCT( user_id)
FROM orders2)

-- # 2. Find all the movies made by top3 directors(in terms of total gross income)


SELECT director, SUM(gross)
FROM movies
GROUP BY director
ORDER BY SUM(gross) DESC 
LIMIT 3

-- ======================= example 01=======================

SELECT * FROM movies
WHERE director IN (SELECT director
FROM movies
GROUP BY director
ORDER BY SUM(gross) DESC 
LIMIT 3)

-- ===================== example 02====================

WITH top_directors AS (SELECT director
FROM movies
GROUP BY director
ORDER BY SUM(gross) DESC 
LIMIT 3)

SELECT * FROM movies
WHERE director IN(SELECT * FROM top_directors);


-- 3. Find all movies of all those actors whose filmography's avg rating > 8.5 (take 25000 votes as cutoff)

USE Datascience;

SELECT * FROM movies WHERE star IN (SELECT star FROM  movies
                                   WHERE votes > 25000
                                   GROUP BY star
                                   HAVING AVG(score) > 8.5)

-- =================Independent Subquery - Table Subquery (Multi COl Multi Row)=============



-- 1. Find the movie with highest profits(vs order by)



SELECT * FROM movies
WHERE (year, gross-budget) IN (SELECT year, MAX(gross - budget)
                               FROM movies GROUP BY year);



-- 2. Find the highest rated movies of each genre votes cutoff of 25000



SELECT * FROM movies WHERE (genre, score) IN (SELECT genre, MAX(score)
							FROM movies
							WHERE votes > 25000)
							GROUP BY genre
AND votes > 25000



-- 3. Find the highest grossing movies of top 5 actor / direction combo in term of total gross income


WITH  top_duos AS (
SELECT star, director, MAX(gross)
FROM movies
GROUP BY star, director
ORDER BY SUM(gross) DESC LIMIT 5)

SELECT * FROM movies
WHERE (star, director, gross) IN (SELECT * FROM top_duos)



-- ====================== Correlated Subquery ===================

-- 1. FInd all the movies that have a rating higer than the average rating of movies
-- in the same genre (Animations)



SELECT * FROM movies m1
WHERE Score > (SELECT AVG (score) FROM movies m2 WHERE m2.genre = m1.genre)


-- 2. Find the favorite food of each customer

WITH fav_food AS (
SELECT t2.user_id, name,f_name, COUNT(*) AS 'frequency' FROM users2 t1
JOIN orders2 t2 ON t1.user_id = t2.user_id
JOIN order_details2 t3 ON t2.order_id = t3.order_id
JOIN food t4 ON t3.f_id = t4.f_id
GROUP BY t2.user_id, t3.f_id
)

SELECT * FROM fav_food f1
WHERE frequency = (SELECT MAX(frequency)
					FROM fav_food f2
					WHERE f2.user_id = f1.user_id)


-- Usage with SELECT 

-- 1. Get the percentage of votes for each movie compared to the total number of votes



USE datascience;
 SELECT name, (votes/(SELECT SUM(votes) FROM movies))*100 FROM movies 


 
 USE datascience;
 SELECT name,genre, score,
 (SELECT AVG(score) FROM movies m2 WHERE m2.genre = m1.genre) 
 FROM movies m1


-- USE with FROM

