-- Testimonials
CREATE TABLE testimonials (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    customer_name VARCHAR(255) NOT NULL,
    photo_url VARCHAR(255),
    text TEXT NOT NULL
);