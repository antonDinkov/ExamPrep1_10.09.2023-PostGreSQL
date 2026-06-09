CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);


CREATE OR REPLACE PROCEDURE sp_courses_by_address(address_name VARCHAR(100))
AS
$$
BEGIN
	TRUNCATE TABLE search_results RESTART IDENTITY;
	
	INSERT INTO search_results (
		address_name,
		full_name,
		level_of_bill,
		make,
		"condition",
		category_name
	)
	SELECT
		a.name,
		cl.full_name,
		CASE
			WHEN cour.bill <= 20 THEN 'Low'
			WHEN cour.bill <= 30 THEN 'Medium'
			ELSE 'High'
		END AS level_of_bill,
		c.make,
		c.condition,
		cat.name AS category_name
	FROM addresses AS a
	JOIN courses AS cour
		ON a.id = cour.from_address_id
	JOIN clients AS cl
		ON cl.id = cour.client_id
	JOIN cars AS c
		ON c.id = cour.car_id
	JOIN categories AS cat
		ON cat.id = c.category_id
	WHERE a.name = address_name
	ORDER BY c.make, cl.full_name;
END;
$$
LANGUAGE plpgsql;