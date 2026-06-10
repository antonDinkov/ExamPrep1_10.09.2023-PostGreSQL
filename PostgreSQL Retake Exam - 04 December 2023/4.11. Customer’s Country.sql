CREATE OR REPLACE PROCEDURE sp_customer_country_name(customer_full_name VARCHAR(50), INOUT country_name VARCHAR(50))
AS
$$
BEGIN
	SELECT co.name INTO country_name
	FROM customers AS c
	JOIN countries AS co
		ON c.country_id = co.id
	WHERE CONCAT_WS(' ', c.first_name, c.last_name) = customer_full_name;
END;
$$
LANGUAGE plpgsql;