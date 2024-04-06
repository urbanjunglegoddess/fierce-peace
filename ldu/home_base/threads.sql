-- Table for Threads
CREATE TABLE homebase.Threads (
    thread_id SERIAL PRIMARY KEY,
    group_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    author_id INT,
    post_date TIMESTAMPTZ,
    CONSTRAINT fk_group
        FOREIGN KEY (group_id)
        REFERENCES homebase.Groups(group_id),
    CONSTRAINT fk_author_thread
        FOREIGN KEY (author_id)
        REFERENCES homebase.users(user_id)
);

-- Table for Thread Comments (Forum)
CREATE TABLE homebase.ThreadComments (
    comment_id SERIAL PRIMARY KEY,
    thread_id INT,
    user_id INT,
    comment_content TEXT,
    comment_date TIMESTAMPTZ,
    CONSTRAINT fk_thread_comments
        FOREIGN KEY (thread_id)
        REFERENCES homebase.Threads(thread_id),
    CONSTRAINT fk_comment_author_thread
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Threads
CREATE TABLE chat_threads (
  thread_id serial PRIMARY KEY,
  name varchar(100)
);

CREATE TABLE chat_messages (
  msg_id serial PRIMARY KEY,
  thread_id integer REFERENCES chat_threads(thread_id),
  user_id integer REFERENCES users(user_id),
  content text NOT NULL,
  msg_date timestamp NOT NULL
);