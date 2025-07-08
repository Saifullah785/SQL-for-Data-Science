# ============================SQL Joining Queries===========================


-- ===================CROSS JOIN=================


SELECT * FROM datascience.users t1
CROSS JOIN datascience.groups t2


-- ===================INNER JOIN==================


SELECT * FROM datascience.membership t1
INNER JOIN datascience.users1 t2
ON t1.user_id = t2.user_id


-- ===================== LEFT JOIN=================


SELECT * FROM datascience.membership t1
LEFT JOIN datascience.users1 t2
ON t1.user_id = t2.user_id


-- ========================RIGHT JOIN==================


SELECT * FROM datascience.membership t1
RIGHT JOIN datascience.users1 t2
ON t1.user_id = t2.user_id


-- ======================= OUTER JOIN========================


-- EXAMPE 01


SELECT * FROM datascience.membership t1
FULL OUTER JOIN datascience.users1 t2
ON t1.user_id = t2.user_id


-- EXAMPLE 02


SELECT * FROM datascience.membership t1
LEFT JOIN datascience.users1 t2
ON t1.user_id = t2.user_id
UNION
SELECT * FROM datascience.membership t1
RIGHT JOIN datascience.users1 t2
ON t1.user_id = t2.user_id



-- =========================SQL SET OPERATIONS===========


SELECT * FROM datascience.person1
UNION
SELECT * FROM datascience.person2


SELECT * FROM datascience.person1
UNION ALL
SELECT * FROM datascience.person2



SELECT * FROM datascience.person1
INTERSECT
SELECT * FROM datascience.person2


SELECT * FROM datascience.person1
EXCEPT
SELECT * FROM datascience.person2

=====================================================

 -- Self Join
 
 
SELECT * FROM datascience.users1 t1
JOIN datascience.users1 t2
ON t1.emergency_contact = t2.user_id


-- Joining on more than one col


SELECT * FROM datascience.students t1
JOIN datascience.class t2
ON t1.class_id = t2.class_id
AND t1.enrollment_year = t2.class_year


-- Joining more than 2 tables - Find order name and corresponding category name 


SELECT * FROM datascience.order_details t1
JOIN datascience.orders t2
ON t1.order_id = t2.order_id
JOIN datascience.users t3
ON t2.user_id = t3.user_id


-- 1. Find order_id, amount, and profit by joining users and orders. 


SELECT t1.order_id, t1.amount, t1.profit, t3.name  
FROM datascience.order_details t1
JOIN datascience.orders t2
ON t1.order_id = t2.order_id
JOIN datascience.users t3
ON t2.user_id = t3.user_id


-- 2. Find order_id, name, and city by joining users and orders. 



SELECT t1.order_id,t2.name, t2.city
FROM datascience.orders t1
JOIN datascience.users t2
ON t1.user_id = t2.user_id




-- 3. find order_id, product category by joining order_details and category



SELECT t1.order_id, t2.vertical
from datascience.order_details t1
JOIN datascience.category t2
ON t1.category_id = t2.category_id



-- ===========================Filtering Rows===========


-- 1. find all the order placed in pune



SELECT * FROM datascience.orders t1
JOIN datascience.users t2
ON t1.user_id = t2.user_id
WHERE t2.city = 'Pune' AND t2.name = 'Sarita'


-- ======================Practice Questions====================

-- 1. Find all profitable orders

SELECT t1.order_id, SUM(t2.profit) FROM datascience.orders t1
JOIN datascience.order_details t2
ON t1.order_id = t2.order_id
GROUP BY t1.order_id
HAVING SUM(t2.profit) > 0



-- 2. Find the customer who has placed max number of orders



SELECT name,COUNT(*) AS 'num_orders' FROM datascience.orders t1
JOIN datascience.users t2
ON t1.user_id = t2.user_id
GROUP BY t2.name
ORDER BY num_orders DESC LIMIT 1


-- 3. which is the most profitable category


SELECT t2.vertical, SUM(profit) FROM datascience.order_details t1
JOIN datascience.category t2
ON t1.category_id = t2.category_id
GROUP BY t2.vertical
ORDER BY SUM(profit) DESC LIMIT 1


SELECT t2.vertical, SUM(profit) FROM datascience.order_details t1
JOIN datascience.category t2
ON t1.category_id = t2.category_id
GROUP BY t2.vertical
ORDER BY SUM(profit) ASC LIMIT 1


-- 4. which is the most profitable state


SELECT state, SUM(profit) FROM datascience.orders t1
JOIN datascience.order_details t2
ON t1.order_id = t2.order_id
JOIN datascience.users t3
ON t1.user_id = t3.user_id
GROUP BY state
ORDER BY SUM(profit) DESC LIMIT 1



-- 5. find all categories with profit higher than 3000



SELECT t2.vertical, SUM(profit) FROM datascience.order_details t1
JOIN datascience.category t2
ON t1.category_id = t2.category_id
GROUP BY t2.vertical
HAVING SUM(profit) > 3000
