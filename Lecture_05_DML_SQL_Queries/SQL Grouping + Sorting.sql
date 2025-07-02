
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


-- # sort phones alphabetically and then on the basic of price in asc order


SELECT * FROM datascience.smartphones
ORDER BY brand_name ASC, price ASC


-- # sort phones alphabetically and then on the basic of rating in desc order


SELECT * FROM datascience.smartphones
ORDER BY brand_name ASC, rating DESC