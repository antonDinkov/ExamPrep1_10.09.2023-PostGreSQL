SELECT
	bg.name,
	bg.rating,
	c.name
FROM board_games AS bg
JOIN players_ranges AS pr
	ON pr.id = bg.players_range_id
JOIN categories AS c
	ON bg.category_id = c.id
WHERE (bg.rating > 7 AND LOWER(bg.name) LIKE '%a%') OR bg.rating > 7.50
ORDER BY bg.name, bg.rating DESC
LIMIT 5;