-- Photo Gallery
CREATE TABLE photos (
   photo_id serial PRIMARY KEY,
   user_id integer REFERENCES users(user_id),
   url varchar(255) NOT NULL,
   description text,
   upload_date date NOT NULL
);