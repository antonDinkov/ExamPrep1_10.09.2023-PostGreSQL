CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT AS
$$
BEGIN
	RETURN (
		SELECT
			COUNT(aph.photo_id)
		FROM accounts_photos AS aph
		JOIN accounts AS a
			ON aph.account_id = a.id
		WHERE a.username = account_username
	);
END;
$$
LANGUAGE plpgsql;