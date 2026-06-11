SELECT
    v.name,
	v.phone_number,
	TRIM(REGEXP_REPLACE(address, 'Sofia\s*,\s*', '')) AS address
FROM volunteers AS v
JOIN volunteers_departments AS vd
    ON v.department_id = vd.id
WHERE vd.department_name = 'Education program assistant' AND v.address ILIKE '%Sofia%'
ORDER BY v.name ASC;

-- или

SELECT
	v.name volunteers,
	v.phone_number,
	SUBSTRING(v.address FROM '^[^,]+,\s*(.*)$') address -- извлича частта от адреса след първата запетая и евентуални интервали
FROM volunteers v
JOIN volunteers_departments vd
	ON v.department_id = vd.id
WHERE v.address ILIKE '%sofia%' AND vd.department_name = 'Education program assistant'
ORDER BY volunteers
;