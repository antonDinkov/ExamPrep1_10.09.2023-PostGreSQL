SELECT
	c.id,
	c.make,
	c.mileage,
	COUNT(cour) AS count_of_courses,
	ROUND(AVG(cour.bill), 2) AS average_bill
FROM cars AS c
LEFT JOIN courses AS cour
ON c.id = cour.car_id
GROUP BY c.id
HAVING COUNT(cour) <> 2
ORDER BY COUNT(cour) DESC, c.id
;