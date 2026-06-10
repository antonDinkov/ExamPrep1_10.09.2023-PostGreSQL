SELECT
    p.id AS photo_id,
    (
        SELECT COUNT(*)
        FROM likes AS l
        WHERE l.photo_id = p.id
    ) AS likes_count,
    (
        SELECT COUNT(*)
        FROM comments AS c
        WHERE c.photo_id = p.id
    ) AS comments_count
FROM photos AS p
ORDER BY likes_count DESC,
         comments_count DESC,
         photo_id ASC;

-- ИЛИ

SELECT
    ph.id AS photo_id,
    COUNT(DISTINCT l.id) AS likes_count,
    COUNT(DISTINCT c.id) AS comments_count
FROM photos ph
LEFT JOIN likes AS l
    ON ph.id = l.photo_id
LEFT JOIN comments AS c
    ON ph.id = c.photo_id
GROUP BY ph.id
ORDER BY likes_count DESC,
         comments_count DESC,
         photo_id ASC;