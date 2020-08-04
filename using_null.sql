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