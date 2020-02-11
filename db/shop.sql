-- DROP TABLE stocks;
DROP TABLE products;
DROP TABLE suppliers;

CREATE TABLE suppliers
(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   adress VARCHAR(255),
   phone VARCHAR(255),
   email VARCHAR(255)
  );

CREATE TABLE products
(
  id  SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  supplier_id INT REFERENCES suppliers(id),
  buy_cost INT,
  sell_price INT,
  quantity INT
  );

-- CREATE TABLE stocks
-- (
--   id SERIAL PRIMARY KEY,
--   product_id INT REFERENCES products(id),
--   quantity INT
--   );
