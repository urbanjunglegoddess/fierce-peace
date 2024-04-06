-- Business Events
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  business_id INTEGER REFERENCES businesses(id),
  name VARCHAR(255) NOT NULL,
  event_type VARCHAR(100),
  start_date DATE,
  start_time TIME,
  end_date DATE,
  end_time TIME,
  description TEXT,
  location VARCHAR(255),
  registration_link VARCHAR(255)
);