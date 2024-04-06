-- Ads
CREATE TABLE ads (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    url VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    start_date DATE,
    end_date DATE
);
