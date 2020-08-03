SELECT name, continent, population FROM world

SELECT name FROM world
WHERE population > 200000000

SELECT name,(gdp/population) AS percapitaGDP FROM world
WHERE population > 200000000