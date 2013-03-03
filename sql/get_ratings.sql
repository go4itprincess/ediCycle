SELECT 
	CEILING(
		20-9768*SUM(
			S.index * SQRT(
				POWER(C.p1x-C.p2x, 2) + POWER(C.p1y-C.p2y, 2)
			)
		 )
		 /
		 (SELECT COUNT(*) FROM `accidents`)
		)/2 as rating,
	1 as acc_count
FROM  `accidents` as A
	LEFT JOIN  `severities` as S 
		ON A.severity = S.id,
	(
		SELECT
			FLOOR (IF (C1.latitude< C2.latitude, C1.latitude, C2.latitude)*1000)/1000 p1y,
			FLOOR (IF (C1.longitude< C2.longitude, C1.longitude, C2.longitude)*1000)/1000 p1x,
			CEILING (IF (C1.latitude< C2.latitude, C2.latitude, C1.latitude)*1000)/1000 p2y,
			CEILING (IF (C1.longitude< C2.longitude, C2.longitude, C1.longitude)*1000)/1000 p2x
		FROM cache C1, cache C2
		WHERE 
			C1.sess = '##sess##'
			AND C2.sess = '##sess##'
			AND C1.id_sess = C2.id_sess +1
	) as C
WHERE 
	A.type = '##type##'
	AND C.p1x <= A.longitude
	AND C.p1y <= A.latitude
	AND C.p2x >= A.longitude
	AND C.p2y >= A.latitude
	AND ABS( (C.p2y - C.p1y) / ( C.p2x - C.p1x ) - ( A.latitude - C.p1y ) / ( A.longitude - C.p1x ) ) < 2