SELECT COUNT(id) AS Stops FROM stops

SELECT id FROM stops
WHERE name = 'Craiglockhart'

SELECT id, name FROM stops JOIN route ON stops.id = route.stop
WHERE num = 4 AND company = 'LRT'
ORDER BY pos
