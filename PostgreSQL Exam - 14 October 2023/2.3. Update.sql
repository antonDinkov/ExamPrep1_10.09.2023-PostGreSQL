UPDATE coaches AS c
SET salary = salary * coach_level
WHERE SUBSTRING(first_name, 1, 1) = 'C'
  AND EXISTS (
      SELECT 1
      FROM players_coaches AS pc
      WHERE pc.coach_id = c.id
);

UPDATE coaches AS c
SET salary = salary * coach_level
WHERE SUBSTRING(first_name, 1, 1) = 'C'
AND (
	SELECT
		COUNT(pc.player_id)
	FROM players_coaches AS pc
	WHERE pc.coach_id = c.id
) >= 1
;

UPDATE coaches AS c
SET salary = salary * coach_level
WHERE SUBSTRING(first_name, 1, 1) = 'C'
AND (
	SELECT
		pc.player_id
	FROM players_coaches AS pc
	WHERE pc.coach_id = c.id
	LIMIT 1
) >= 1
;