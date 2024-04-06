-- Business Photos
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(100),
    url VARCHAR(255) NOT NULL,
    description VARCHAR(500)
);

-- Videos
CREATE TABLE videos (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    video_url VARCHAR(255) NOT NULL,
    thumbnail_url VARCHAR(255)
);