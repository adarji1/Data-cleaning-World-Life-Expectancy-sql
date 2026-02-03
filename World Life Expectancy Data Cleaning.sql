# WORLD LIFE EXPECTANCY PROJECT (DATA CLEANING)


SELECT * FROM world_life_expectancy;

-- Which country–year combinations appear more than once in the world life expectancy data?

SELECT country, year, concat(country, year), count(concat(country, year))
FROM world_life_expectancy
GROUP BY  country, year, concat(country, year)
HAVING count(concat(country, year)) > 1;

-- Which rows should be removed to keep only one record per country per year?
SELECT *
FROM (
		SELECT ROW_ID, concat(country, year),
		ROW_NUMBER() OVER(PARTITION BY concat(country, year) ORDER BY concat(country, year)) AS ROW_NUM
		FROM world_life_expectancy) AS ROW_TABLE
WHERE ROW_NUM > 1;

--Remove all duplicate rows for the same country–year combination, keeping only the first occurrence.

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

-- What are the unique development statuses in the dataset?
SELECT DISTINCT(Status)
FROM world_life_expectancy;

--Which countries in the dataset are classified as Developing?
select DISTINCT(Country)
from world_life_expectancy
WHERE Status = 'Developing';

--For countries and years where Life expectancy is missing, what are the life expectancy values in the previous and next years, so we can estimate or impute the missing value?
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
