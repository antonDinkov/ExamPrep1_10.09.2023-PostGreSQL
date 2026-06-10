DELETE FROM products_ingredients AS pi
USING ingredients AS i, distributors AS d
WHERE pi.ingredient_id = i.id
  AND i.distributor_id = d.id
  AND LEFT(d.name, 1) = 'L';

DELETE FROM ingredients AS i
USING distributors AS d
WHERE i.distributor_id = d.id
  AND LEFT(d.name, 1) = 'L';

DELETE FROM distributors AS d
WHERE LEFT(d.name, 1) = 'L';