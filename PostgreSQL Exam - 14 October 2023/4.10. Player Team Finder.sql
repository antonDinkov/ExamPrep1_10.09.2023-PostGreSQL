CREATE OR REPLACE PROCEDURE sp_players_team_name(player_name VARCHAR(50), INOUT team_name VARCHAR(45))
AS
$$
BEGIN
	SELECT
		t.name  INTO team_name
	FROM players AS pl
	LEFT JOIN teams AS t
		ON pl.team_id = t.id
	WHERE pl.first_name || ' ' || pl.last_name = player_name;

	IF
		team_name IS NULL THEN team_name := 'The player currently has no team';
	END IF;
END;
$$
LANGUAGE plpgsql;

