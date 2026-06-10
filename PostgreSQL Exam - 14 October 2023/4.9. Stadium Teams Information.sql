CREATE OR REPLACE FUNCTION fn_stadium_team_name(stadium_name VARCHAR(30))
RETURNS SETOF VARCHAR(45) AS
$$
BEGIN
	RETURN QUERY
		SELECT
			t.name
		FROM teams AS t
		JOIN stadiums AS st
			ON st.id = t.stadium_id
		WHERE st.name = stadium_name
		ORDER BY t.name
	;
END;
$$
LANGUAGE plpgsql;