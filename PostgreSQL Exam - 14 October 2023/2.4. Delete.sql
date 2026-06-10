DELETE FROM players_coaches
WHERE player_id IN (
    SELECT id
    FROM players
    WHERE hire_date < '2013-12-13 07:18:46'
);

DELETE FROM players
WHERE hire_date < '2013-12-13 07:18:46';

--или

DELETE FROM players_coaches AS pc
USING players AS p
WHERE pc.player_id = p.id
  AND p.hire_date < '2013-12-13 07:18:46';

DELETE FROM players
WHERE hire_date < '2013-12-13 07:18:46';