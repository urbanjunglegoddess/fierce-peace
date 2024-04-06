-- Wishlists
CREATE TABLE wishlists (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  name VARCHAR(255) NOT NULL
);

-- Wishlist Items
CREATE TABLE wishlist_items (
  wishlist_id INTEGER REFERENCES wishlists(id) ON DELETE CASCADE,
  product_id INTEGER REFERENCES products(id),
  added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (wishlist_id, product_id)
);