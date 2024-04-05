-- Table for Notifications
CREATE TABLE homebase.Notifications (
    notification_id SERIAL PRIMARY KEY,
    user_id INT,
    notification_content TEXT,
    notification_date TIMESTAMPTZ,
    is_read BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_user_notification
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);