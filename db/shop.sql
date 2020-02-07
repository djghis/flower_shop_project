DROP TABLE stocks;
DROP TABLE products;
DROP TABLE suppliers;

CREATE TABLE suppliers
(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   contact_details TEXT
  );

CREATE TABLE products
(
  id  SERIAL PRIMARY KEY,
  name VARCHAR(255) not null,
  description TEXT,
  supplier_id INT REFERENCES products(id),
  buy cost INT,
  sell price INT
  );

CREATE TABLE stocks
(
  id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(id),
  quantity INT
  );
