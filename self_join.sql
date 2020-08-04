SELECT COUNT(id) AS Stops FROM stops

SELECT id FROM stops
WHERE name = 'Craiglockhart'

SELECT id, name FROM stops JOIN route ON stops.id = route.stop
WHERE num = 4 AND company = 'LRT'
ORDER BY pos

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149