SELECT c.labelCourse as matiere , n.subjectNote as sujet ,u.lastName as nom , u.firstName as prenom , n.valueNote as note
FROM course c, user u, notes n
WHERE n.idUser=u.idUser
AND c.idCourse=n.idCourse;


SELECT DISTINCT c.labelCourse as matiere , n.subjectNote as sujet ,u.lastName as nom , u.firstName as prenom , AVG(n.valueNote) as moyenneNote
FROM course c, user u, notes n
WHERE n.idUser=u.idUser
  AND c.idCourse=n.idCourse
group by u.lastName, c.labelCourse