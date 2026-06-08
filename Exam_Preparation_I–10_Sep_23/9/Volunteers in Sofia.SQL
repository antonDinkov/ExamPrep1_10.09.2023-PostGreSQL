SELECT
    v.name,
	v.phone_number,
	TRIM(REGEXP_REPLACE(address, 'Sofia\s*,\s*', '')) AS address
FROM volunteers AS v
JOIN volunteers_departments AS vd
    ON v.department_id = vd.id
WHERE vd.department_name = 'Education program assistant' AND v.address ILIKE '%Sofia%'
ORDER BY v.name ASC;