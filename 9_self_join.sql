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

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

SELECT r1.company, r1.num FROM route r1
JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company)
WHERE 
r1.stop IN (115)
AND
r2.stop IN (137)
GROUP BY r1.num,r1.company;

SELECT r1.company, r1.num
  FROM route r1 
    JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company) 
      JOIN stops s1 ON (r1.stop = s1.id) 
        JOIN stops s2 ON (r2.stop = s2.id) 
  WHERE 
    s1.name = 'Craiglockhart' 
  AND 
    s2.name = 'Tollcross';

SELECT s2.name, r1.company, r1.num
  FROM route r1 
    JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company) 
      JOIN stops s1 ON (r1.stop = s1.id) 
        JOIN stops s2 ON (r2.stop = s2.id) 
  WHERE 
    s1.name = 'Craiglockhart';

SELECT DISTINCT start.num, start.company, transfer.name,finish.num, finish.company
FROM
 route AS start
JOIN
route AS to_transfer ON start.num = to_transfer.num AND start.company = to_transfer.company
JOIN
stops AS transfer ON to_transfer.stop = transfer.id
JOIN
route AS from_transfer ON transfer.id = from_transfer.stop
JOIN
route AS finish ON finish.num = from_transfer.num AND finish.company = from_transfer.company
WHERE
 start.stop IN(
SELECT id FROM stops
WHERE name = 'Craiglockhart') AND finish.stop IN (
SELECT id FROM stops
WHERE name = 'Lochend')
ORDER BY start.num,transfer.name,4