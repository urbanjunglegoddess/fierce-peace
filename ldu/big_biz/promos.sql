-- Promotions
CREATE TABLE promotions (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    name VARCHAR(255),
    description TEXT,
    discount NUMERIC(4,2),
    start_date DATE,
    end_date DATE
);