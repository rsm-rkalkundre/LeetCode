# Write your MySQL query statement below
WITH CTE as(
SELECT product_id, 'store1' as store, store1 as price
from products 
UNION ALL
SELECT product_id, 'store2' as store, store2 as price
from products
UNION ALL
SELECT product_id, 'store3' as store, store3 as price
from products)
SELECT *
FROM CTE
WHERE price is not null