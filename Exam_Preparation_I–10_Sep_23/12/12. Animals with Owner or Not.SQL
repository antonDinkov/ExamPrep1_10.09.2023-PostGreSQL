CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30),
    INOUT result VARCHAR(50)
)
AS
$$
BEGIN
    SELECT COALESCE(o.name, 'For adoption')
    INTO result
    FROM animals a
    LEFT JOIN owners o
        ON o.id = a.owner_id
    WHERE a.name = animal_name;
END;
$$
LANGUAGE plpgsql;