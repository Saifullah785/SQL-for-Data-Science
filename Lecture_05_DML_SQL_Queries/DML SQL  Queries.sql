-- # 1. Create the 'datascience' database if it does not already exist-- 

-- CREATE DATABASE IF NOT EXISTS datascience--


-- # 2. Select all columns and rows from the 'smartphones' table in the 'datascience' database

-- SELECT * FROM datascience.smartphones WHERE 1;--


-- # 3. Select the operating system, model, and battery capacity for all smartphones

-- SELECT os,model,battery_capacity FROM datascience.smartphones ; --


-- # 4. Select the operating system (renamed as 'Operating System,'), model, and battery capacity (renamed as mAH) for all smartphones

-- SELECT os AS 'Operating System,' ,model,battery_capacity AS mAH  FROM datascience.smartphones ;--


-- # 5. Select the model and the square of the resolution width for each smartphone

/* SELECT model, resolution_width*resolution_width FROM datascience.smartphones

-- Select the model and the sum of the squares of resolution width and height for each smartphone
SELECT model, resolution_width*resolution_width + resolution_height*resolution_height FROM datascience.smartphones

-- Select the model and calculate the pixel density (PPI) using the Pythagorean theorem divided by screen size
SELECT model, SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size FROM datascience.smartphones */


-- # 6. Select the model and the rating divided by 10 for each smartphone

-- SELECT model, rating/10 FROM datascience.smartphones--