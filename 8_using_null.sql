SELECT teacher.name FROM teacher LEFT JOIN dept ON dept.id = teacher.id
WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

SELECT name,COALESCE(NULL,mobile, '07986 444 2266') FROM teacher

SELECT teacher.name, COALESCE(NULL,dept.name,'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT COUNT(name),COUNT(mobile) FROM teacher

SELECT dept.name,COUNT(teacher.name)
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
GROUP BY dept.name

SELECT name, 
 (CASE WHEN dept IN (1, 2) THEN 'Sci' ELSE 'Art' END)
FROM teacher;

SELECT name,
       (CASE WHEN dept IN (1,2) THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END)
FROM teacher;