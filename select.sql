SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
  WHERE continent = 'Europe' AND gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')

SELECT name, continent FROM world
WHERE continent IN(
SELECT DISTINCT continent FROM world
WHERE name IN('Argentina','Australia'))
ORDER BY name

SELECT name, population FROM world
WHERE population > (
SELECT population FROM world
WHERE name = 'Canada') AND 
population < 
(
SELECT population FROM world
WHERE name = 'Poland')

SELECT
  name,
  CONCAT(
  ROUND(
    (
      population / (SELECT population
  FROM world
  WHERE name = 'Germany'))*100, 0
    ), '%'
  )
FROM world
WHERE continent = 'Europe'