CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
	animal_name VARCHAR(30),
	INOUT owner_name VARCHAR(50)
)
AS
$$
BEGIN
	SELECT
		CASE
			WHEN a.owner_id IS NULL THEN 'For adoption'
			ELSE o.name
		END
	INTO owner_name
	FROM animals a
	LEFT JOIN owners o
		ON a.owner_id = o.id
	WHERE a.name = animal_name;
END;
$$
LANGUAGE plpgsql;