-- Users
CREATE TABLE users(
    user_id serial PRIMARY KEY,
    name varchar(50),
    first_name varchar(50),
    last_name varchar(50),
    city varchar(100),
	state varchar(100),
	country varchar(100),
    email varchar(100) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
	language varchar(100),
	sec_language varchar(100),
	other_languages text,
	gender varchar(50),
    joined_date TIMESTAMP TIME_ZONE NOT NULL,
    ethnicity varchar(50)
	);


-- User Profiles
CREATE TABLE profiles (
    user_id integer PRIMARY KEY REFERENCES users(user_id),
    first_name varchar(50),
    last_name varchar(50),
    country varchar(100),
    city varchar(100),
    bio text
);

-- Table for users
CREATE TABLE homebase.users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    join_date DATE
);

-- Table for User Roles
CREATE TABLE homebase.UserRoles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- Table for User Role Assignments
CREATE TABLE homebase.UserRoleAssignments (
    assignment_id SERIAL PRIMARY KEY,
    user_id INT,
    role_id INT,
    CONSTRAINT fk_user_role_assignment
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id),
    CONSTRAINT fk_role_assignment
        FOREIGN KEY (role_id)
        REFERENCES homebase.UserRoles(role_id)
);

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

-- Table for User Settings
CREATE TABLE homebase.UserSettings (
    setting_id SERIAL PRIMARY KEY,
    user_id INT,
    theme VARCHAR(50),
    language VARCHAR(50),
    CONSTRAINT fk_user_settings
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Additional tables or modifications can be added based on specific requirements

-- Table for User Bookmarks
CREATE TABLE homebase.UserBookmarks (
    bookmark_id SERIAL PRIMARY KEY,
    user_id INT,
    bookmarked_item_id INT,
    bookmarked_item_type VARCHAR(50),
    CONSTRAINT fk_user_bookmark
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Activity Logs
CREATE TABLE homebase.UserActivityLogs (
    log_id SERIAL PRIMARY KEY,
    user_id INT,
    activity_description TEXT,
    activity_date TIMESTAMPTZ
);

-- Table for User Ratings
CREATE TABLE homebase.UserRatings (
    rating_id SERIAL PRIMARY KEY,
    user_id INT,
    rated_item_id INT,
    rated_item_type VARCHAR(50),
    rating_value DECIMAL(2, 1),
    CONSTRAINT fk_user_rating
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Additional tables or modifications can be added based on specific requirements

-- Table for User Photos
CREATE TABLE homebase.UserPhotos (
    photo_id SERIAL PRIMARY KEY,
    user_id INT,
    photo_url VARCHAR(255),
    upload_date TIMESTAMPTZ,
    CONSTRAINT fk_user_photo
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Addresses
CREATE TABLE homebase.UserAddresses (
    address_id SERIAL PRIMARY KEY,
    user_id INT,
    street_address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    CONSTRAINT fk_user_address
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Preferences
CREATE TABLE homebase.UserPreferences (
    preference_id SERIAL PRIMARY KEY,
    user_id INT,
    preference_name VARCHAR(50),
    preference_value TEXT,
    CONSTRAINT fk_user_preference
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Additional tables or modifications can be added based on specific requirements

-- Table for User Purchases
CREATE TABLE homebase.UserPurchases (
    purchase_id SERIAL PRIMARY KEY,
    user_id INT,
    purchase_date TIMESTAMPTZ,
    total_amount DECIMAL(15, 2),
    CONSTRAINT fk_user_purchase
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Payments
CREATE TABLE homebase.UserPayments (
    payment_id SERIAL PRIMARY KEY,
    user_id INT,
    payment_date TIMESTAMPTZ,
    payment_amount DECIMAL(15, 2),
    payment_method VARCHAR(50),
    CONSTRAINT fk_user_payment
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Invoices
CREATE TABLE homebase.UserInvoices (
    invoice_id SERIAL PRIMARY KEY,
    user_id INT,
    invoice_date TIMESTAMPTZ,
    total_amount DECIMAL(15, 2),
    CONSTRAINT fk_user_invoice
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Additional tables or modifications can be added based on specific requirements

-- Table for User Events
CREATE TABLE homebase.UserEvents (
    event_id SERIAL PRIMARY KEY,
    user_id INT,
    event_name VARCHAR(255),
    event_date TIMESTAMPTZ,
    location VARCHAR(255),
    description TEXT,
    CONSTRAINT fk_user_event
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Feedback
CREATE TABLE homebase.UserFeedback (
    feedback_id SERIAL PRIMARY KEY,
    user_id INT,
    feedback_content TEXT,
    feedback_date TIMESTAMPTZ,
    CONSTRAINT fk_user_feedback
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Achievements
CREATE TABLE homebase.UserAchievements (
    achievement_id SERIAL PRIMARY KEY,
    user_id INT,
    achievement_name VARCHAR(255),
    achievement_date TIMESTAMPTZ,
    description TEXT,
    CONSTRAINT fk_user_achievement
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Additional tables or modifications can be added based on specific requirements

-- Table for User Education
CREATE TABLE homebase.UserEducation (
    education_id SERIAL PRIMARY KEY,
    user_id INT,
    institution_name VARCHAR(255),
    degree VARCHAR(100),
    major VARCHAR(100),
    graduation_date DATE,
    CONSTRAINT fk_user_education
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Certifications
CREATE TABLE homebase.UserCertifications (
    certification_id SERIAL PRIMARY KEY,
    user_id INT,
    certification_name VARCHAR(255),
    organization VARCHAR(255),
    issue_date DATE,
    expiration_date DATE,
    CONSTRAINT fk_user_certification
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Skills
CREATE TABLE homebase.UserSkills (
    skill_id SERIAL PRIMARY KEY,
    user_id INT,
    skill_name VARCHAR(100),
    proficiency_level VARCHAR(50),
    CONSTRAINT fk_user_skill
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Additional tables or modifications can be added based on specific requirements

-- Table for User Job History
CREATE TABLE homebase.UserJobHistory (
    job_history_id SERIAL PRIMARY KEY,
    user_id INT,
    company_name VARCHAR(255),
    position VARCHAR(100),
    start_date DATE,
    end_date DATE,
    job_description TEXT,
    CONSTRAINT fk_user_job_history
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Projects
CREATE TABLE homebase.UserProjects (
    project_id SERIAL PRIMARY KEY,
    user_id INT,
    project_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    project_description TEXT,
    CONSTRAINT fk_user_project
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Connections
CREATE TABLE homebase.UserConnections (
    connection_id SERIAL PRIMARY KEY,
    user_id INT,
    connected_user_id INT,
    connection_date TIMESTAMPTZ,
    CONSTRAINT fk_user_connection
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id),
    CONSTRAINT fk_connected_user
        FOREIGN KEY (connected_user_id)
        REFERENCES homebase.users(user_id)
);

-- Additional tables or modifications can be added based on specific requirements

-- Table for User Account Settings
CREATE TABLE homebase.UserAccountSettings (
    setting_id SERIAL PRIMARY KEY,
    user_id INT,
    theme VARCHAR(50),
    language VARCHAR(50),
    email_notifications BOOLEAN,
    CONSTRAINT fk_user_account_settings
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Function to Update User Account Settings
CREATE OR REPLACE FUNCTION homebase.update_user_settings(
    p_user_id INT,
    p_theme VARCHAR(50),
    p_language VARCHAR(50),
    p_email_notifications BOOLEAN
)
RETURNS VOID AS $$
BEGIN
    UPDATE homebase.UserAccountSettings
    SET
        theme = p_theme,
        language = p_language,
        email_notifications = p_email_notifications
    WHERE
        user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;

-- Example usage of the function to update user settings
-- CALL homebase.update_user_settings(1, 'Dark', 'English', true);


-- Function to Get User Account Settings
CREATE OR REPLACE FUNCTION homebase.get_user_settings(
    p_user_id INT
)
RETURNS TABLE (
    theme VARCHAR(50),
    language VARCHAR(50),
    email_notifications BOOLEAN
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        theme,
        language,
        email_notifications
    FROM
        homebase.UserAccountSettings
    WHERE
        user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;

-- Example usage of the function to get user settings
-- SELECT * FROM homebase.get_user_settings(1);

-- Table for User Profile
CREATE TABLE homebase.UserProfile (
    profile_id SERIAL PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(255),
    bio TEXT,
    profile_picture_url VARCHAR(255),
    CONSTRAINT fk_user_profile
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Function to Update User Profile
CREATE OR REPLACE FUNCTION homebase.update_user_profile(
    p_user_id INT,
    p_full_name VARCHAR(255),
    p_bio TEXT,
    p_profile_picture_url VARCHAR(255)
)
RETURNS VOID AS $$
BEGIN
    UPDATE homebase.UserProfile
    SET
        full_name = p_full_name,
        bio = p_bio,
        profile_picture_url = p_profile_picture_url
    WHERE
        user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;

-- Example usage of the function to update user profile
-- CALL homebase.update_user_profile(1, 'John Doe', 'A software developer', 'https://example.com/profile.jpg');

-- Function to Get User Profile
CREATE OR REPLACE FUNCTION homebase.get_user_profile(
    p_user_id INT
)
RETURNS TABLE (
    full_name VARCHAR(255),
    bio TEXT,
    profile_picture_url VARCHAR(255)
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        full_name,
        bio,
        profile_picture_url
    FROM
        homebase.UserProfile
    WHERE
        user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;

-- Example usage of the function to get user profile details
-- SELECT * FROM homebase.get_user_profile(1);


-- Table for User Authentication
CREATE TABLE homebase.UserAuthentication (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    CONSTRAINT fk_user_authentication
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Function to Update User Password
CREATE OR REPLACE FUNCTION homebase.update_user_password(
    p_user_id INT,
    p_new_password VARCHAR(255)
)
RETURNS VOID AS $$
BEGIN
    UPDATE homebase.UserAuthentication
    SET
        password_hash = p_new_password
    WHERE
        user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;

-- Example usage of the function to update user password
-- CALL homebase.update_user_password(1, 'newhashedpassword');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- News Center

CREATE TABLE news_articles(
    article_id serial PRIMARY KEY,
    title varchar(200) NOT NULL,
    content text NOT NULL,
    publish_date date NOT NULL
);

-- Table for News Channel
CREATE TABLE homebase.NewsChannel (
    news_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    publish_date TIMESTAMPTZ
);


-- Table for News Channel
CREATE TABLE homebase.NewsChannel (
    news_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    publish_date TIMESTAMPTZ
);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Blog
CREATE TABLE blogs (
    blog_id serial PRIMARY KEY,
    title varchar(200) NOT NULL,
    content text NOT NULL,
    publish_date date NOT NULL

-- Table for Blogs
CREATE TABLE homebase.Blogs (
    blog_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    author_id INT,
    publish_date TIMESTAMPTZ,
    CONSTRAINT fk_author_blog
        FOREIGN KEY (author_id)
        REFERENCES homebase.users(user_id)
);
-- Table for Blog Comments
CREATE TABLE homebase.BlogComments (
    comment_id SERIAL PRIMARY KEY,
    blog_id INT,
    user_id INT,
    comment_content TEXT,
    comment_date TIMESTAMPTZ,
    CONSTRAINT fk_blog_comments
        FOREIGN KEY (blog_id)
        REFERENCES homebase.Blogs(blog_id),
    CONSTRAINT fk_comment_author_blog
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Groups
CREATE TABLE groups (
  group_id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  description text NOT NULL
);

CREATE TABLE group_members (
  member_id serial PRIMARY KEY,
  group_id integer REFERENCES groups(group_id),
  user_id integer REFERENCES users(user_id)
);

-- Table for Groups
CREATE TABLE homebase.Groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table for Group Members
CREATE TABLE homebase.GroupMembers (
    member_id SERIAL PRIMARY KEY,
    group_id INT,
    user_id INT,
    join_date DATE,
    CONSTRAINT fk_group_member
        FOREIGN KEY (group_id)
        REFERENCES homebase.Groups(group_id),
    CONSTRAINT fk_member_user
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Notifications
CREATE TABLE notifications (
   notification_id serial PRIMARY KEY,
   user_id integer REFERENCES users(user_id),
   type varchar(50) NOT NULL,
   message text NOT NULL,
   is_read boolean DEFAULT FALSE,
   created_at timestamp NOT NULL
);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Photo Gallery
CREATE TABLE photos (
   photo_id serial PRIMARY KEY,
   user_id integer REFERENCES users(user_id),
   url varchar(255) NOT NULL,
   description text,
   upload_date date NOT NULL
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Hashtags
CREATE TABLE hashtags (
    id serial PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL
);

CREATE TABLE post_hashtags (
   post_id integer REFERENCES posts(post_id),
   hashtag_id integer REFERENCES hashtags(id),
   PRIMARY KEY (post_id, hashtag_id)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Friends/Contacts
CREATE TABLE friends (
    friend_id serial PRIMARY KEY,
    user_id integer REFERENCES users(user_id),
    friend_cust_id integer REFERENCES users(user_id)
);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Video uploads
CREATE TABLE videos (
    video_id serial PRIMARY KEY,
    user_id integer REFERENCES users(user_id),
    title varchar(255) NOT NULL,
    description text,
    filename varchar(255) NOT NULL,
    upload_date date NOT NULL
);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Categories
CREATE TABLE categories (
  category_id serial PRIMARY KEY,
  name varchar(255) NOT NULL
);

-- Categorization of posts
CREATE TABLE post_categories (
   post_id integer REFERENCES posts(post_id),
   category_id integer REFERENCES categories(category_id),
   PRIMARY KEY (post_id, category_id)
);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tags
CREATE TABLE tags (
  id serial PRIMARY KEY,
  name varchar(50) UNIQUE NOT NULL
);

-- Post tags
CREATE TABLE post_tags (
   post_id integer REFERENCES posts(post_id),
   tag_id integer REFERENCES tags(id),
   PRIMARY KEY (post_id, tag_id)
);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Reactions for posts, articles, blogs etc.
CREATE TABLE reactions (
  id serial PRIMARY KEY,
  user_id integer REFERENCES users(user_id),
  post_id integer, -- could reference different post id columns
  reaction_type varchar(50) NOT NULL
    CHECK (reaction_type IN ('like','love','happy','funny','surprised','sad','angry'))
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Bookmarks/favorites
CREATE TABLE bookmarks (
  id serial PRIMARY KEY,
  user_id integer REFERENCES users(user_id),
  bookmark_type varchar(50) NOT NULL, -- post, article etc
  content_id integer -- id column of bookmarked item
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Articles
CREATE TABLE homebase.Articles (
    article_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    author_id INT,
    publish_date TIMESTAMPTZ,
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
        REFERENCES homebase.users(user_id)
);

-- Table for Articles
CREATE TABLE homebase.Articles (
    article_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    author_id INT,
    publish_date TIMESTAMPTZ,
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
        REFERENCES homebase.users(user_id)
);

-- Table for Article Comments
CREATE TABLE homebase.ArticleComments (
    comment_id SERIAL PRIMARY KEY,
    article_id INT,
    user_id INT,
    comment_content TEXT,
    comment_date TIMESTAMPTZ,
    CONSTRAINT fk_article_comments
        FOREIGN KEY (article_id)
        REFERENCES homebase.Articles(article_id),
    CONSTRAINT fk_comment_author
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table for Challenge Participants
CREATE TABLE homebase.ChallengeParticipants (
    participant_id SERIAL PRIMARY KEY,
    challenge_id INT,
    user_id INT,
    CONSTRAINT fk_challenge_participant
        FOREIGN KEY (challenge_id)
        REFERENCES homebase.UserChallenges(challenge_id),
    CONSTRAINT fk_participant_user
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

-- Table for User Challenges
CREATE TABLE homebase.UserChallenges (
    challenge_id SERIAL PRIMARY KEY,
    user_id INT,
    challenge_name VARCHAR(255),
    start_date TIMESTAMPTZ,
    end_date TIMESTAMPTZ,
    description TEXT,
    CONSTRAINT fk_user_challenge
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
