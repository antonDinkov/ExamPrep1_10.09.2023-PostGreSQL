UPDATE animals
SET owner_id = (
	SELECT
		o.id
	FROM owners AS o
	WHERE o.name = 'Kaloqn Stoqnov' LIMIT 1
)
WHERE owner_id IS NULL
;