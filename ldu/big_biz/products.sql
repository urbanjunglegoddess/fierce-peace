-- Products table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  business_id INTEGER REFERENCES businesses(id),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(100),
  price NUMERIC(10,2) CHECK (price > 0),
  qty_available INTEGER DEFAULT 0,
  featured BOOLEAN DEFAULT false
);