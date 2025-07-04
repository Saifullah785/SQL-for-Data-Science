-- ========================== SORTING===========================

-- # 1. Find the top samsung phones with biggest screen size


SELECT model, screen_size FROM datascience.smartphones WHERE brand_name = 'samsung' 
ORDER BY screen_size DESC LIMIT 5



-- # 2. Sort all the phones in decending order of number of total cameras



SELECT model, num_front_cameras + num_rear_cameras AS 'total_cameras' From datascience.smartphones
ORDER BY total_cameras DESC 


-- # 3. sort data on the basis of ppi in decreasing order



SELECT model,
SQRT((resolution_width * resolution_width + resolution_height*resolution_height)/screen_size) AS 'ppi'
FROM datascience.smartphones ORDER BY ppi DESC



-- # 4. Find the phone with 2nd largest battery



SELECT model, battery_capacity
FROM datascience.smartphones
ORDER BY battery_capacity ASC LIMIT 1,1


-- # 5. find the name and rating of the worst rated apple phone


SELECT model,rating
FROM datascience.smartphones
WHERE brand_name = 'apple'
ORDER BY rating ASC LIMIT 1


-- # 6. sort phones alphabetically and then on the basic of price in asc order


SELECT * FROM datascience.smartphones
ORDER BY brand_name ASC, price ASC


-- # 7. sort phones alphabetically and then on the basic of rating in desc order


SELECT * FROM datascience.smartphones
ORDER BY brand_name ASC, rating DESC


-- # 8. find the phone name,price of the costiest phone


SELECT model,price FROM datascience.smartphones
ORDER BY price DESC LIMIT 1

# =================Group BY==================================


-- 1. Group smartphones by brand and get the count , average price , max rating , avg screen size and avg battery capacity


SELECT brand_name, COUNT(*) AS "num_phones",
ROUND(AVG(price)) AS 'avg price',
MAX(rating) AS 'max rating',
ROUND(AVG(screen_size),2) AS 'avg screen size',
ROUND(AVG(battery_capacity)) AS 'avg battery capacity'
FROM datascience.smartphones
GROUP BY brand_name
ORDER BY num_phones DESC LIMIT 15


-- 2. Group smartphones by whether they have an NFC and get the average price and rating

SELECT has_nfc,
AVG(price) AS 'avg price',
AVG(rating) AS 'avg rating'
FROM datascience.smartphones
GROUP BY has_nfc

SELECT has_5g,
AVG(price) AS 'avg price',
AVG(rating) AS 'avg rating'
FROM datascience.smartphones
GROUP BY has_5g

SELECT fast_charging_available,
AVG(price) AS 'avg price',
AVG(rating) AS 'avg rating'
FROM datascience.smartphones
GROUP BY fast_charging_available


-- 3. Group smartphones by the extended memory available and get the average price


SELECT extended_memory_available,
AVG(price) AS 'avg price',
AVG(rating) AS 'avg rating'
FROM datascience.smartphones
GROUP BY extended_memory_available


-- 4. Group smartphone by brand an processor brand and get the count of models and the average primary camera resolution

SELECT brand_name,
processor_brand,os,
COUNT(*) AS 'num phones',
ROUND(AVG(primary_camera_rear)) AS 'avg camera resolution'
FROM datascience.smartphones
GROUP BY brand_name, processor_brand,os


-- 5. Find top 5 most costly phone brands


SELECT brand_name, ROUND(AVG(price)) AS 'avg_price'
FROM datascience.smartphones
GROUP BY brand_name
ORDER BY avg_price DESC LIMIT 5


-- 6. which brand makes the smallest screen smartphones


SELECT brand_name, ROUND(AVG(screen_size)) AS 'avg_screen_size'
FROM datascience.smartphones
GROUP BY brand_name
ORDER BY avg_screen_size DESC LIMIT 1



-- 7. Avg price of 5G phone vs Avg price of Non 5G phones
-- 8.Group smartphones by the brand, and find the brand with the highest number of models that have both NFC and IR blaster


SELECT * 
FROM datascience.smartphones
WHERE has_nfc = 'True' AND has_ir_blaster= 'TRUE'


SELECT brand_name, COUNT(*) AS 'count'
FROM datascience.smartphones
WHERE has_nfc = 'True' AND has_ir_blaster= 'TRUE'
GROUP BY brand_name
ORDER BY count DESC LIMIT 1



-- order by order work=== FROM ---> WHERE ---> GROUP BY ---> SELECT ---> ORDER BY 


-- 9. find all samsung 5G enables smartphones and find out the avg price for NFC and Non NFC phones


SELECT has_nfc, AVG(price) AS 'avg_price'
FROM datascience.smartphones
WHERE brand_name = 'samsung'
GROUP BY has_nfc


-- ============================= Having clause ===========================



SELECT brand_name,
COUNT(*) AS 'count',
AVG(price) AS  'avg_price'
FROM datascience.smartphones
GROUP BY brand_name
HAVING count > 40
ORDER BY avg_price DESC


-- 1. find the average rating of smartphones brands which have more than 20 phones

SELECT brand_name,
COUNT(*) AS 'count',
AVG(price) AS  'avg_price'
FROM datascience.smartphones
GROUP BY brand_name
HAVING count > 40
ORDER BY avg_price DESC


SELECT brand_name,
COUNT(*) AS 'count',
AVG(rating) AS  'avg_rating'
FROM datascience.smartphones
GROUP BY brand_name
HAVING count > 40
ORDER BY avg_rating DESC


/* 2. find the top 3 brand with the higest avg ran that have a refresh rate  of at least 40 hz
 and fast charging available and don't consider brand which have less than 20 phones

*/

SELECT brand_name,
AVG (ram_capacity) AS 'avg_ram'
FROM datascience.smartphones 
WHERE refresh_rate > 90 AND fast_charging_available = 1 
GROUP BY brand_name
HAVING COUNT(*) > 10
ORDER BY 'avg_ram' DESC LIMIT 3


/* 3. find the avg price of all phone brands with avg rating > 70
and num_phones more than 10 amoung all 5G enabled phones
*/


SELECT brand_name, 
AVG(price) AS avg_price
FROM datascience.smartphones 
WHERE has_5g = 'True'
GROUP BY brand_name
HAVING AVG(rating) > 70 AND COUNT(*) > 10














