-- Video uploads
CREATE TABLE videos (
    video_id serial PRIMARY KEY,
    user_id integer REFERENCES users(user_id),
    title varchar(255) NOT NULL,
    description text,
    filename varchar(255) NOT NULL,
    upload_date date NOT NULL
);