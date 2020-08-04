SELECT teacher.name FROM teacher LEFT JOIN dept ON dept.id = teacher.id
WHERE dept IS NULL