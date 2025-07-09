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


-- second way(order by )--

SELECT * FROM movies
ORDER BY (gross - budget) DESC LIMIT 1





