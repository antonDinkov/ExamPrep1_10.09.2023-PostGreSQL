DELETE FROM board_games
WHERE publisher_id IN (
    SELECT p.id
    FROM publishers AS p
    JOIN addresses AS a ON p.address_id = a.id
    WHERE a.town LIKE 'L%'
);

DELETE FROM publishers
WHERE address_id IN (
    SELECT id
    FROM addresses
    WHERE town LIKE 'L%'
);

DELETE FROM addresses
WHERE town LIKE 'L%';

-- следното е според таблицата

DELETE FROM addresses
WHERE SUBSTRING(town, 1, 1) = 'L'
;