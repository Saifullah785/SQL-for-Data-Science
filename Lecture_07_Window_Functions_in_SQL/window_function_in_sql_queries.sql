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













