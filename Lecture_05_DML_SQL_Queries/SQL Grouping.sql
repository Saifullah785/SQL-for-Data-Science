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





