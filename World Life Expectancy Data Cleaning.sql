# WORLD LIFE EXPECTANCY PROJECT (DATA CLEANING)

SELECT * FROM world_life_expectancy;

SELECT country, year, concat(country, year), count(concat(country, year))
FROM world_life_expectancy
GROUP BY  country, year, concat(country, year)
HAVING count(concat(country, year)) > 1;

SELECT *
FROM (
		SELECT ROW_ID, concat(country, year),
		ROW_NUMBER() OVER(PARTITION BY concat(country, year) ORDER BY concat(country, year)) AS ROW_NUM
		FROM world_life_expectancy) AS ROW_TABLE
WHERE ROW_NUM > 1;


DELETE FROM world_life_expectancy
WHERE 
	ROW_ID IN ( 
		SELECT ROW_ID
				FROM (
					SELECT ROW_ID, concat(country, year),
					ROW_NUMBER() OVER(PARTITION BY concat(country, year) ORDER BY concat(country, year)) AS ROW_NUM
					FROM world_life_expectancy) AS ROW_TABLE
WHERE ROW_NUM > 1
)
;


SELECT DISTINCT(Status)
FROM world_life_expectancy;

select DISTINCT(Country)
from world_life_expectancy
WHERE Status = 'Developing';

UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Country IN (
select DISTINCT(Country)
from world_life_expectancy
WHERE Status = 'Developing');  # sub queries do not work in update table 

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developing'
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developed'
;

select DISTINCT(country)
from world_life_expectancy
WHERE Status = '';

SELECT *
from world_life_expectancy;

SELECT country, `Life expectancy`
from world_life_expectancy
WHERE `Life expectancy` = '';

SELECT t1.country, t1.year, t1.`Life expectancy`,
t2.Country, t2.year, t2.`Life expectancy`,
t3.Country, t3.year, t3.`Life expectancy`,
ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
from world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
    AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
	ON t1.country = t3.country
    AND t1.year = t3.year + 1
WHERE t1.`Life expectancy` = ''; 

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
    AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
	ON t1.country = t3.country
    AND t1.year = t3.year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy` = '';