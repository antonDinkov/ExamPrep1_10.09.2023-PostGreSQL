SELECT
    a.name AS address,
	CASE
		WHEN EXTRACT(HOUR FROM cour.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	cour.bill,
	cl.full_name,
	c.make,
	c.model,
	cat.name
FROM courses AS cour
JOIN addresses AS a
    ON cour.from_address_id = a.id
JOIN clients AS cl
    ON cour.client_id = cl.id
JOIN cars AS c
    ON cour.car_id = c.id
JOIN categories AS cat
    ON cat.id = c.category_id
ORDER BY cour.id
;