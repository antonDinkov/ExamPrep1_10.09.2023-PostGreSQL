SELECT
	cr.last_name,
	CEILING(AVG(bg.rating)) AS average_rating,
	p.name AS publisher_name
FROM creators AS cr
JOIN creators_board_games AS cbg
	ON cr.id = cbg.creator_id
JOIN board_games AS bg
	ON bg.id = cbg.board_game_id
JOIN publishers AS p
	ON p.id = bg.publisher_id
WHERE p.name = 'Stonemaier Games'
GROUP BY cr.id, p.name
ORDER BY AVG(bg.rating) DESC
;