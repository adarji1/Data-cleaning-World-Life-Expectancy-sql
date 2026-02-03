# World Life Expectancy (EXPLORATORY DATA ANALYSIS)

SELECT *
FROM world_life_expectancy;	

SELECT country, 
min(`Life expectancy`), 
max(`Life expectancy`),
ROUND(max(`Life expectancy`) - min(`Life expectancy`),1) AS LIFE_INCREASE_15_YEARS
from world_life_expectancy
GROUP BY country
HAVING min(`Life expectancy`) <> 0
AND max(`Life expectancy`) <> 0
ORDER BY LIFE_INCREASE_15_YEARS ASC;

-- what is the average life expectancy for each year ?

SELECT year, ROUND(avg(`Life expectancy`),2) 
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
AND `Life expectancy` <> 0
GROUP BY year
ORDER BY year;

SELECT
SUM(CASE WHEN GDP >=1500 THEN 1 ELSE 0 END) HIGH_GDP_COUNT,
AVG(CASE WHEN GDP >=1500 THEN `Life expectancy` ELSE NULL END) HIGH_GDP_Life_expectancy,
SUM(CASE WHEN GDP <=1500 THEN 1 ELSE 0 END) LOW_GDP_COUNT,
AVG(CASE WHEN GDP <=1500 THEN `Life expectancy` ELSE NULL END) LOW_GDP_Life_expectancy
FROM world_life_expectancy
;	

SELECT status, round(avg(`Life expectancy`),1)
FROM world_life_expectancy
Group by status;

SELECT status, count(distinct country), round(avg(`Life expectancy`),1)
FROM world_life_expectancy
Group by status;

SELECT country, ROUND(AVG(`Life expectancy`),1) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
group by country
HAVING Life_Exp > 0
AND BMI > 0
ORDER BY BMI DESC
;

SELECT country,
year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY country ORDER BY year) AS ROLLING_TOTAL
FROM world_life_expectancy
WHERE country LIKE  '%UNITED%';
