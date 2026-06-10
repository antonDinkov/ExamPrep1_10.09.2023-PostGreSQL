UPDATE products AS p
SET price = price * 1.1
FROM feedbacks AS f
WHERE p.id = f.product_id
  AND f.rate > 8;