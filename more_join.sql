SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr FROM movie
WHERE title = 'Citizen Kane'

SELECT id,title,yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr 

SELECT id FROM actor
WHERE name = 'Glenn Close'

SELECT id FROM movie
WHERE title = 'Casablanca'

SELECT name from casting JOIN actor ON (actorid=id)
WHERE movieid=11768

SELECT name from casting JOIN actor ON (actorid=id)
WHERE movieid = (SELECT id
FROM movie
WHERE title = 'Alien')

SELECT title FROM movie JOIN casting ON (id=movieid)
WHERE actorid = (SELECT id FROM actor
WHERE name = 'Harrison Ford')

SELECT title FROM movie JOIN casting ON (id=movieid)
WHERE actorid = (SELECT id FROM actor
WHERE name = 'Harrison Ford' AND ord!=1)

SELECT title, name FROM movie JOIN casting ON (id=movieid)
JOIN actor ON (casting.actorid=actor.id)
WHERE yr = '1962' AND ord = 1

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

SELECT title, name FROM movie JOIN casting ON (id=movieid)
JOIN actor ON (casting.actorid=actor.id)
AND ord = 1
WHERE movieid IN
( SELECT movieid
FROM movie JOIN casting JOIN actor
ON movie.id = casting.movieid AND casting.actorid = actor.id
WHERE name = 'Julie Andrews' )

SELECT name
FROM casting JOIN actor
ON actorid = actor.id
WHERE ord=1
GROUP BY name
HAVING COUNT(movieid)>=15;

SELECT title, COUNT(actorid) AS actors
FROM movie JOIN casting JOIN actor
ON movie.id = casting.movieid AND casting.actorid = actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY actors DESC, title