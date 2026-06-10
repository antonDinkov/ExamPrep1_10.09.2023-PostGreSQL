SELECT
	c.first_name || ' ' || c.last_name AS coach_full_name,
	pl.first_name || ' ' || pl.last_name AS player_full_name,
	t.name AS team_name,
	skd.passing,
	skd.shooting,
	skd.speed
FROM teams AS t
JOIN players AS pl
ON pl.team_id = t.id
JOIN players_coaches AS plc
ON pl.id = plc.player_id
JOIN coaches AS c
ON c.id = plc.coach_id
JOIN skills_data AS skd
ON skd.id = pl.skills_data_id
ORDER BY coach_full_name, player_full_name DESC
;