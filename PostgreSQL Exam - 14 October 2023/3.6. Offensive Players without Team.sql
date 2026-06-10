SELECT
	players.id,
	CONCAT_WS(' ', first_name, last_name),
	age,
	"position",
	salary,
	pace,
	shooting
FROM players
JOIN skills_data
ON players.skills_data_id = skills_data.id
WHERE "position" = 'A' AND team_id IS NULL AND (pace + shooting) > 130
;