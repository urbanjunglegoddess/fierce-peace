-- Private messages
CREATE TABLE messages (
    message_id serial PRIMARY KEY,
    from_id integer REFERENCES users(user_id),
    to_id integer REFERENCES users(user_id),
    content text NOT NULL,
    sent_date timestamp NOT NULL
);

-- Table for User Messages
CREATE TABLE homebase.UserMessages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT,
    recipient_id INT,
    message_content TEXT,
    send_date TIMESTAMPTZ,
    CONSTRAINT fk_sender_user_msg
        FOREIGN KEY (sender_id)
        REFERENCES homebase.users(user_id),
    CONSTRAINT fk_recipient_user_msg
        FOREIGN KEY (recipient_id)
        REFERENCES homebase.users(user_id)
);