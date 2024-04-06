-- Real Estate Listings
CREATE TABLE real_estate (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(255),
    description TEXT,
    location VARCHAR(255),
    property_type VARCHAR(100),
    sale_price NUMERIC(10,2),
    rental_price NUMERIC(10,2),
    is_rental BOOLEAN,
    photo_url VARCHAR(255)
);