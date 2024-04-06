-- Forum
CREATE TABLE forums (
    forum_id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    description text NOT NULL
);
CREATE TABLE forum_topics (
    topic_id serial PRIMARY KEY,
    title varchar(200) NOT NULL,
    create_date timestamp NOT NULL,
    forum_id integer REFERENCES forums(forum_id)
);

CREATE TABLE forum_posts (
    post_id serial PRIMARY KEY,
    topic_id integer REFERENCES forum_topics(topic_id),
    user_id integer REFERENCES users(user_id),
    content text,
    post_date timestamp NOT NULL
);

-- Table for Forum
CREATE TABLE homebase.Forum (
    forum_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table for Forum Moderators
CREATE TABLE homebase.ForumModerators (
    moderator_id SERIAL PRIMARY KEY,
    forum_id INT,
    user_id INT,
    CONSTRAINT fk_forum_moderator
        FOREIGN KEY (forum_id)
        REFERENCES homebase.Forum(forum_id),
    CONSTRAINT fk_moderator_user
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);