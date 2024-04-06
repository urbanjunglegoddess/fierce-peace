-- Orders table
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  total_amount NUMERIC(10,2) CHECK (total_amount > 0),
  placed_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Order items table
-- (links orders to specific products)
CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INTEGER REFERENCES orders(id),
  product_id INTEGER REFERENCES products(id),
  qty INTEGER NOT NULL CHECK (qty > 0),
  item_price NUMERIC(10,2) NOT NULL
);