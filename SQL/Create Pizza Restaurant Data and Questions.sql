CREATE TABLE customers (
  customer_id INT UNIQUE,
  name TEXT,
  gender TEXT,
  phone_number TEXT
);

CREATE TABLE orders (
  order_id INT UNIQUE,
  date TEXT,
  customer_id INT,
  items_id INT,
  quantity INT
);

CREATE TABLE menus (
  menu_id INT UNIQUE,
  menu_name TEXT,
  price REAL
);


INSERT INTO customers 
VALUES  (1, 'Beam', 'M', '0885262913'), 
        (2, 'Boom', 'M', '0811112222'),
        (3, 'Tonsai', 'M', '0827894632'),
        (4, 'Chaya', 'F', '0923452211'),
        (5, 'Minnie', 'F', '0623812022'),
        (6, 'Toon', 'F', '0987456123'),
        (7, 'Baegi', 'M', '0848779820'),
        (8, 'Umi', 'F', '0904561267'),
        (9, 'Pluem', 'M', '0817482323'),
        (10, 'Guy', 'M', '0833472034');

INSERT INTO orders 
VALUES  (1, '2023-01-04', 2, 2, 1), 
        (2, '2023-01-04', 4, 1, 3),
        (3, '2023-01-05', 4, 1, 2),
        (4, '2023-01-07', 1, 3, 1),
        (5, '2023-01-09', 7, 3, 4),
        (6, '2023-01-09', 3, 2, 1),
        (7, '2023-01-09', 6, 5, 2),
        (8, '2023-01-12', 9, 1, 1),
        (9, '2023-01-12', 10, 1, 2),
        (10,'2023-01-13', 10, 3, 2),
        (11,'2023-01-13', 2, 2, 1),
        (12,'2023-01-13', 4, 2, 4),
        (13,'2023-01-13', 1, 5, 2),
        (14,'2023-01-15', 6, 2, 1),
        (15,'2023-01-16', 6, 2, 1),
        (16,'2023-01-18', 5, 1, 3),
        (17,'2023-01-18', 1, 4, 2),
        (18,'2023-01-19', 3, 5, 1),
        (19,'2023-01-19', 2, 1, 1),
        (20,'2023-01-23', 9, 1, 4),
        (21,'2023-01-26', 9, 4, 2),
        (22,'2023-01-26', 7, 1, 1),
        (23,'2023-01-27', 5, 1, 1),
        (24,'2023-01-29', 4, 3, 2),
        (25,'2023-02-01', 6, 2, 4);
  
INSERT INTO menus 
VALUES  (1, 'Hawaiian', 250.50), 
        (2, 'Seafood Cocktail', 270.00),
        (3, 'Super Deluxe', 230.50),
        (4, 'Tom Yam Kung',  245.00),
        (5, 'Double Pepperoni', 220.50);
        

.mode box
--- Find total price of each orders in specific date range
SELECT 
  o.date,
  c.name,
  m.menu_name,
  o.quantity,
  o.quantity * m.price AS total_price
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN menus m
ON o.items_id = m.menu_id
WHERE o.date BETWEEN '2023-01-07' AND '2023-01-14';

-- Find specific customer by filtering data from phone call
SELECT 
  c.name,
  m.menu_name,
  o.quantity,
  c.phone_number,
  o.date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN menus m
ON o.items_id = m.menu_id
WHERE o.date = '2023-01-09' AND 
      c.gender = 'F' AND 
      c.phone_number LIKE '09%';


-- Rank Menu Popularity
WITH sup AS (
  SELECT 
    m.menu_name AS menu,
    SUM(o.quantity) AS menu_count
  FROM orders o
  INNER JOIN menus m
  ON o.items_id = m.menu_id
  GROUP BY m.menu_name
)

SELECT 
  menu,
  menu_count,
  CASE  WHEN menu_count > 15 THEN 'Popular Menu'
        WHEN menu_count > 10 THEN 'Good Menu'
        ELSE 'Needed Recipe Improvement '
  END AS noted
FROM sup
ORDER BY menu_count DESC;
