DELETE FROM clients
WHERE
	LENGTH(full_name) > 3
	AND id NOT IN (
		SELECT client_id
		FROM courses
		)
;

-- или

DELETE FROM clients AS cl
WHERE NOT EXISTS (
    SELECT 1
    FROM courses AS c
    WHERE c.client_id = cl.id
)
AND LENGTH(cl.full_name) > 3;