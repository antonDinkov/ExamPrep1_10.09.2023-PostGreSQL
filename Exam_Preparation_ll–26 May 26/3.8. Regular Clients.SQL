-- БЕЗ AND да си отбележа синтаксиса при различните команди щото много ги бъркам

SELECT
    cl.full_name,
    COUNT(DISTINCT cour.car_id) AS count_of_cars,
    SUM(cour.bill) AS total_sum
FROM clients AS cl
JOIN courses AS cour
    ON cl.id = cour.client_id
WHERE SUBSTRING(cl.full_name, 2, 1) = 'a'
GROUP BY cl.id
HAVING COUNT(DISTINCT cour.car_id) > 1
ORDER BY cl.full_name;


-- ИЛИ

SELECT
    full_name,
    COUNT(*) AS count_of_cars,
    SUM(total_bill) AS total_sum
FROM (
    SELECT
        cl.id,
        cl.full_name,
        cour.car_id,
        SUM(cour.bill) AS total_bill
    FROM clients AS cl
    JOIN courses AS cour
        ON cour.client_id = cl.id
    WHERE SUBSTRING(cl.full_name, 2, 1) = 'a'
    GROUP BY cl.id, cl.full_name, cour.car_id
) AS t
GROUP BY id, full_name
HAVING COUNT(*) > 1
ORDER BY full_name;