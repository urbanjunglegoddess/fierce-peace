-- Reviews Table
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  text TEXT NOT NULL,
  rating SMALLINT CHECK (rating >= 1 AND rating <= 5),
  business_id INTEGER REFERENCES businesses(id),
  user_id INTEGER REFERENCES users(id),
  created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);