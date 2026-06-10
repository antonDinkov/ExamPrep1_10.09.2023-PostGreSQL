SELECT
	t.id AS team_id,
	t.name AS team_name,
	COUNT(pl) AS player_count,
	t.fan_base
FROM teams AS t
LEFT JOIN players AS pl
ON pl.team_id = t.id
WHERE t.fan_base > 30000
GROUP BY t.id
ORDER BY player_count DESC, fan_base DESC
;