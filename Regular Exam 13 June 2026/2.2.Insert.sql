INSERT INTO items (name, quantity, price, description, brand_id, classification_id)
SELECT
    CONCAT('Item', r.created_at),
    r.customer_id,
    r.rating * 5,
    NULL,
    r.item_id,
    (
        SELECT item_id
        FROM reviews
        ORDER BY item_id ASC
        LIMIT 1
    )
FROM reviews AS r
ORDER BY r.item_id ASC
LIMIT 10;