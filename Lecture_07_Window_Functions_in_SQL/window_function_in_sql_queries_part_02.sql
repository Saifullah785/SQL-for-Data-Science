-- =======================Ranking=============

-- ========================Cumulative Sum=========

/*Cumulative sum is another type of calculation that can be performed using
window functions. A cumulative sum calculates the sum of a set of values up to a
given point in time, and includes all previous values in the calculation.
*/


SELECT * FROM ipl.ipl_delivery;

SELECT * FROM (SELECT BattingTeam,batter,SUM(batsman_run) AS 'total_runs',
DENSE_RANK() OVER(PARTITION BY BattingTeam ORDER BY SUM(batsman_run) DESC) AS 'rank_within_team'
FROM ipl_delivery
GROUP BY BattingTeam,batter) t
WHERE t.rank_within_team < 6
ORDER BY t.BattingTeam,t.rank_within_team;


SELECT * FROM (SELECT 
CONCAT("Match-",CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS 'match_no',
SUM(batsman_run) AS 'runs_scored',
SUM(SUM(batsman_run)) OVER w AS 'career_runs',
AVG(SUM(batsman_run)) OVER w AS 'career_avg',
AVG(SUM(batsman_run)) OVER(ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS 'rolling_avg'
FROM ipl
WHERE batter = 'V Kohli'
GROUP BY ID
WINDOW w AS (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) t


