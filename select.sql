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

SELECT name
FROM world
WHERE
gdp > (SELECT MAX(gdp)
FROM world
WHERE continent = 'Europe');

SELECT continent, name, area
FROM world w1
WHERE
area >= ALL (SELECT area
FROM world w2
WHERE w1.continent = w2.continent);

SELECT continent,
  (SELECT name
  FROM world w2
  WHERE w1.continent = w2.continent
  ORDER BY name 
  LIMIT 1) AS 'name'
FROM world AS w1
GROUP BY continent

SELECT name, continent, population
FROM world w1
WHERE 
(SELECT MAX(population)
FROM world
WHERE continent = w1.continent ) <= 25000000;

SELECT
  name, continent
FROM world w1
WHERE 
population > ALL (
SELECT (population * 3) as population
FROM world w2
WHERE w2.continent = w1.continent
  AND
  name <> w1.name
)