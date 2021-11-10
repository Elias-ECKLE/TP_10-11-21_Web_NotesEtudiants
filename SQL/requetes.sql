SELECT c.labelCourse as matière , n.subjectNote as sujet ,u.lastName as nom , u.firstName as prénom , n.valueNote as note
FROM course c, user u, notes n
WHERE n.idUser=u.idUser
AND c.idCourse=n.idCourse