-- Creating a table for working on window function in sql --
USE datascience;
CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);

INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51)

SELECT *, AVG(marks) OVER(PARTITION BY branch) from datascience.marks

USE datascience;

SELECT * ,
AVG(marks) OVER()  AS 'Overall_avg',
MIN(marks) OVER(),
MAX(marks) OVER(),
MIN(marks) OVER(PARTITION BY branch),
MAX(marks) OVER(PARTITION BY branch)
FROM marks
ORDER BY student_id


-- Aggregate Function with over()--


-- Find all the students who have marks higher than the avg marks of their respective branch


SELECT * FROM (SELECT *, 
AVG(marks) OVER(PARTITION BY branch) AS 'branch_avg'
from datascience.marks) t
WHERE t.marks > t.branch_avg


-- RANK / DENSE_RANK / ROW_NUMBER


SELECT *,
RANK() OVER(PARTITION BY branch ORDER BY marks DESC),
DENSE_RANK() OVER(PARTITION BY branch ORDER BY marks DESC)
FROM marks



SELECT *,
CONCAT(branch, '-', ROW_NUMBER() OVER(PARTITION BY branch))
FROM marks


-- 1. Find top 2 most paying customers of each month 

SELECT * FROM (SELECT MONTHNAME(date) AS 'month', user_id, SUM(amount) AS 'total',
               RANK() OVER(PARTITION BY MONTHNAME(date) ORDER BY SUM(amount) DESC) AS 'month_rank'
               FROM orders2
			   GROUP BY MONTHNAME(date), user_id
               ORDER BY MONTH(date)) t
               WHERE t.month_rank < 3
               ORDER BY month DESC,month_rank ASC



-- 2. Delete roll no from branch and marks

USE datascience;
-- FIRST VALUE/LAST VALUE / NTH_VALUE

-- 1. Find the branch toppers


SELECT * FROM marks;

SELECT *,
FIRST_VALUE(name) OVER(ORDER BY marks DESC)
FROM marks


SELECT *,
LAST_VALUE(marks) OVER(ORDER BY marks DESC)
FROM marks

-- - ================== FRAME ===========================

/*A frame is a window is a subset of row within the partition that 
determine the scope of the window function calculation .the frame
is defined using a combination of two clauses in the window functins rows and between.
*/

SELECT *,
FIRST_VALUE(name) OVER( PARTITION BY branch 
						ORDER BY marks DESC
						  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM marks







