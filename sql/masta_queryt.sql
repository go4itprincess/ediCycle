/*dan*/
SELECT sum(S.index )
	FROM  `accidents` A LEFT JOIN `severities` S on A.severity = S.id,
		(SELECT FLOOR(if(C1.latitude< C2.latitude, C1.latitude, C2.latitude)*10000)/10000 p1y, FLOOR(if(C1.longitude< C2.longitude, C1.longitude, C2.longitude)*10000)/10000 p1x,CEILING(if(C1.latitude< C2.latitude, C2.latitude, C1.latitude)*10000)/10000 p2y,CEILING(if(C1.longitude< C2.longitude, C2.longitude, C1.longitude)*10000)/10000 p2x
			FROM cache C1, cache C2
			WHERE C1.id=C2.id+1
		) C
WHERE C.p1x<=A.latitude AND C.p1y<=A.longitude AND C.p2x>=A.latitude AND C.p2y>=A.longitude
