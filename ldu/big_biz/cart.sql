-- Shopping Cart
CREATE TABLE shopping_carts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  total_price NUMERIC(10,2) DEFAULT 0 CHECK (total_price >= 0),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Shopping Cart Items
CREATE TABLE cart_items (
  id SERIAL PRIMARY KEY,
  cart_id INTEGER REFERENCES shopping_carts(id) ON DELETE CASCADE,
  product_id INTEGER REFERENCES products(id),
  qty INTEGER NOT NULL DEFAULT 1 CHECK (qty > 0),
  price NUMERIC(10,2) NOT NULL CHECK (price > 0)
);