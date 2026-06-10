SELECT
	a.id || ' ' || a.username AS id_username,
	a.email
FROM accounts AS a
JOIN accounts_photos AS aph
	 ON a.id = aph.account_id
JOIN photos AS ph
	 ON ph.id = aph.photo_id
WHERE a.id = ph.id
ORDER BY a.id
;