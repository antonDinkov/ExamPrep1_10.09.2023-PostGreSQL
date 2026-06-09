CREATE OR REPLACE FUNCTION fn_creator_with_board_games(firstName VARCHAR(30))
RETURNS INT AS
$$
BEGIN
	RETURN(
		SELECT
			COUNT(cbg.board_game_id)
		FROM creators AS cr
		JOIN creators_board_games AS cbg
			ON cbg.creator_id = cr.id
		WHERE cr.first_name = firstName
	);
END;
$$
LANGUAGE plpgsql