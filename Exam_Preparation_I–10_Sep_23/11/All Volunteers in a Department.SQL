CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT AS
$$
BEGIN
	RETURN (
		SELECT
			COUNT(v)
		FROM volunteers_departments vd
		JOIN volunteers v
			ON vd.id = v.department_id
		WHERE vd.department_name = searched_volunteers_department
	);
END;
$$
LANGUAGE plpgsql;




