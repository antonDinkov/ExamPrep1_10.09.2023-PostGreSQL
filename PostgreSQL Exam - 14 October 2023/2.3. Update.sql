UPDATE coaches AS c
SET salary = salary * coach_level
WHERE SUBSTRING(first_name, 1, 1) = 'C'
  AND EXISTS (
      SELECT 1
      FROM players_coaches AS pc
      WHERE pc.coach_id = c.id
        AND pc.player_id IS NOT NULL
);

UPDATE coaches AS c
SET salary = salary * coach_level
WHERE SUBSTRING(first_name, 1, 1) = 'C'
AND (
	SELECT
		COUNT(pc.player_id)
	FROM players_coaches AS pc
	WHERE pc.coach_id = c.id
        AND pc.player_id IS NOT NULL
) >= 1
;

UPDATE coaches c
SET salary = salary * coach_level
WHERE (
	SELECT
		1
	FROM players_coaches pc
	WHERE pc.coach_id = c.id AND pc.player_id IS NOT NULL
	LIMIT 1
) = 1 AND LEFT(c.first_name, 1) = 'C';