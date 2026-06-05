SELECT
    name,
    (SELECT
		animal_type
	FROM animal_types
	WHERE id = animals.animal_type_id
	) AS animal_type,
	TO_CHAR(birthdate, 'DD.MM.YYYY') AS birthdate
FROM animals
ORDER BY
    name ASC
;