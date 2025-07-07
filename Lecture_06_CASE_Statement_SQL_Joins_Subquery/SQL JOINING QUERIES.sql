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







