SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012

SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

SELECT team1,team2,player
  FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10

 SELECT mdate,teamname
  FROM game JOIN eteam on team1=eteam.id
WHERE coach = 'Fernando Santos'

SELECT player
  FROM game JOIN goal ON (id=matchid)
WHERE stadium LIKE 'National Stadium, Warsaw'

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' AND teamid!='GER') OR (team2='GER' AND teamid!='GER')

SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname
 ORDER BY teamname

SELECT stadium, COUNT(player)
  FROM game JOIN goal ON (id=matchid)
  GROUP BY stadium