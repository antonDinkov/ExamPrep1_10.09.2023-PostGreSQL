SELECT
	CONCAT(c.first_name, ' ', c.last_name) as full_name,
	c.email,
	MAX(bg.rating) as rating
FROM creators AS c
JOIN creators_board_games AS cbg
	ON c.id = cbg.creator_id
JOIN board_games AS bg
	ON bg.id = cbg.board_game_id
WHERE RIGHT(c.email, 4) = '.com'
GROUP BY
	c.id,
    c.first_name,
    c.last_name,
    c.email
ORDER BY full_name
;