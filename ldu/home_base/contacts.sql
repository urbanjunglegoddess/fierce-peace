-- Friends/Contacts
CREATE TABLE friends (
    friend_id serial PRIMARY KEY,
    user_id integer REFERENCES users(user_id),
    friend_cust_id integer REFERENCES users(user_id)
);

-- Table for Customer Followers (for Social Media)
CREATE TABLE homebase.CustomerFollowers (
    follower_id SERIAL PRIMARY KEY,
    user_id INT,
    follower_user_id INT,
    CONSTRAINT fk_user_followers
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id),
    CONSTRAINT fk_follower_user
        FOREIGN KEY (follower_user_id)
        REFERENCES homebase.users(user_id)
);
