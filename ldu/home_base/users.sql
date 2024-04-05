-- SCHEMA: homebase

-- DROP DATABASE IF EXISTS homebase;

CREATE TABLE IF NOT EXISTS users
    AUTHORIZATION postgres;
	
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
    gender varchar(50),
    ethnicity varchar(50),
	language varchar(100),
	sec_language varchar(100),
	other_languages text,
    bio text,
    joined_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
	);


-- Table for User Roles
CREATE TABLE homebase.roles (
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
        REFERENCES homebase.roles(role_id)
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

-- Table for User Profile Pictures
CREATE TABLE homebase.UserProfilePictures (
    picture_id SERIAL PRIMARY KEY,
    user_id INT,
    picture_url VARCHAR(255),
    CONSTRAINT fk_user_profile_picture
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);

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