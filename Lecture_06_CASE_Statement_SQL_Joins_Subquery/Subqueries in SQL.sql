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











