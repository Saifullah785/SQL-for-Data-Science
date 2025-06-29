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



-- # 7. Select the model and a static label 'smartphone' as the type for each record

-- SELECT model, 'smartphone' AS 'type' FROM datascience.smartphones



-- # 8. Select all unique brand names from the smartphones table

-- SELECT DISTINCT (brand_name) AS 'All brands' FROM datascience.smartphones



-- # 9. Select all unique processor brands from the smartphones table

-- SELECT DISTINCT (processor_brand) AS 'All processors' FROM datascience.smartphones



-- # 10. Select all unique operating systems from the smartphones table

-- SELECT DISTINCT (os) AS 'All processors' FROM datascience.smartphones



-- # 11. Select all unique combinations of brand name and processor brand

-- SELECT DISTINCT brand_name,processor_brand from datascience.smartphones



-- # 12. Select all smartphones where the brand is Apple

-- SELECT * FROM datascience.smartphones WHERE brand_name = 'apple'



-- # 13. Select all smartphones with a price greater than 100,000

-- SELECT * FROM datascience.smartphones WHERE price > 100000



-- # 14.  Select all smartphones with a price between 10,000 and 20,000 (exclusive)

-- SELECT * FROM datascience.smartphones WHERE price > 10000 AND price < 20000



-- # 15. Select all smartphones with a price between 10,000 and 20,000 (inclusive)

-- SELECT * FROM datascience.smartphones Where price BETWEEN 10000 AND 20000



-- # 16. Select all smartphones with a price less than 15,000 and rating greater than 80

-- SELECT * FROM datascience.smartphones WHERE price < 15000 AND rating > 80

  

-- # 17. Select all smartphones with a price less than 15,000, rating greater than 80, and Snapdragon processor

-- SELECT * FROM datascience.smartphones WHERE price < 15000 AND rating > 80 AND processor_brand = 'snapdragon'



-- # 18. Select all Samsung smartphones with RAM capacity greater than 8GB

-- SELECT * FROM datascience.smartphones WHERE brand_name = 'samsung' AND ram_capacity > 8



-- # 19. Select all Samsung smartphones with Snapdragon processor

-- SELECT * FROM datascience.smartphones WHERE brand_name = 'samsung' AND processor_brand = 'snapdragon'

