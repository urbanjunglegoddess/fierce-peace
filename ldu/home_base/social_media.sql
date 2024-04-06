-- Social Media Feed
CREATE TABLE posts (
    post_id serial PRIMARY KEY,
    user_id integer REFERENCES users(user_id),
    content text,
    post_date timestamp NOT NULL
);


-- Table for Social Media Feed
CREATE TABLE homebase.SocialMediaFeed (
    post_id SERIAL PRIMARY KEY,
    user_id INT,
    post_content TEXT,
    post_date TIMESTAMPTZ,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);