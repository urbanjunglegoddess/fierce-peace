-- Job Postings
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100),
    location VARCHAR(255),
    salary NUMERIC(10,2),
    contact_email VARCHAR(320),
    is_active BOOLEAN DEFAULT TRUE
);