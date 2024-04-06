-- Freelancer Listings
CREATE TABLE freelancers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    title VARCHAR(255),
    description TEXT,
    skills TEXT[],
    hourly_rate NUMERIC(10,2),
    profile_url VARCHAR(255),
    contact_email VARCHAR(320)
);