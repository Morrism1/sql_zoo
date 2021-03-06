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

SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid,mdate;

SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
GROUP BY matchid,mdate;

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game left JOIN goal ON matchid = id group by mdate, matchid, 
         team1,team2