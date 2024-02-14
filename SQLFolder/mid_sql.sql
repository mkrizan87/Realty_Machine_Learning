create database if not exists house_price_regression;
use house_price_regression;
drop table if exists house_price_data;
CREATE TABLE house_price_data (
  `id` varchar(20) UNIQUE NOT NULL,
  `date` varchar(20) DEFAULT NULL,
  `bedrooms` varchar(4) DEFAULT NULL,
  `bathrooms` varchar(6) DEFAULT NULL,
  `sqft_living` float DEFAULT NULL,
  `sqft_lot` float DEFAULT NULL,
  `floors` int(4) DEFAULT NULL,
  `waterfront` int(4) DEFAULT NULL,
  `view` int(4) DEFAULT NULL,
  `condition` int(4) DEFAULT NULL,
  `grade` int(4) DEFAULT NULL,
  `sqft_above` float DEFAULT NULL,
  `sqft_basement` float DEFAULT NULL,
  `yr_built` int(11) DEFAULT NULL,
  `yr_renovated` int(11) DEFAULT NULL,
  `zip_code` varchar(11) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `sqft_living15` float DEFAULT NULL,
  `sqft_lot15` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (`id`)  -- constraint keyword is optional but its a good practice
);
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
load data local infile 'C:/Users/Martin/MidJup/regression_data.csv'
into table house_price_data
fields terminated BY ',';
select * from house_price_data;
SELECT count(*) from house_price_data;
ALTER TABLE house_price_data
DROP COLUMN date;
select * from house_price_data
limit 10;
select count(*) from house_price_data;
select * from house_price_data
order by price desc;
select id from house_price_data
order by price desc
limit 10;
SELECT DISTINCT bedrooms FROM house_price_data
order by bedrooms desc;
SELECT DISTINCT bathrooms FROM house_price_data
order by bathrooms desc;
SELECT DISTINCT floors FROM house_price_data
order by floors desc;
SELECT DISTINCT house_price_data.condition FROM house_price_data
order by house_price_data.condition desc;
SELECT DISTINCT grade FROM house_price_data
order by grade desc;
select avg(price) from house_price_data;
SELECT bedrooms, AVG(price) AS AveragePriceBED
FROM house_price_data
GROUP BY bedrooms
ORDER BY bedrooms;
SELECT bedrooms, AVG(sqft_living) AS `Average Sqft_Living`
FROM house_price_data
GROUP BY bedrooms;
SELECT waterfront, AVG(price) AS AveragePrice
FROM house_price_data
GROUP BY waterfront;
SELECT `condition`, AVG(grade) AS AverageGrade
FROM house_price_data
GROUP BY `condition`
ORDER BY `condition`;
SELECT `condition`, AVG(grade) AS AverageGrade, COUNT(*) AS NumberOfHouses
FROM house_price_data
GROUP BY `condition`
ORDER BY `condition`;
SELECT *
FROM house_price_data
WHERE bedrooms >=3
  AND bathrooms > 3
  AND floors = 1
  AND waterfront = 0
  AND `condition` >= 3
  AND grade >= 5
  AND price < 300000;
SELECT *
FROM house_price_data
WHERE price < 300000
  AND bedrooms >= 3
  AND bedrooms <= 4
  AND floors = 1
  order by bathrooms desc
LIMIT 10;
SELECT *
FROM house_price_data
WHERE price > (SELECT AVG(price) * 2 FROM house_price_data)
order by price asc;
CREATE VIEW Houses_with_higher_than_double_average_price AS
SELECT *
FROM house_price_data
WHERE price > (SELECT AVG(price) * 2 FROM house_price_data);
SELECT * FROM Houses_with_higher_than_double_average_price;
SELECT bedrooms, AVG(price) AS AveragePrice
FROM house_price_data
WHERE bedrooms IN (3, 4)
GROUP BY bedrooms;
SELECT DISTINCT zip_code
FROM house_price_data
ORDER BY zip_code;
select * from house_price_data
where yr_renovated > 0
order by yr_renovated desc;
SELECT *
FROM house_price_data
ORDER BY price DESC
LIMIT 1 OFFSET 10;