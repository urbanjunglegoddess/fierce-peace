-- Create a table for the user's to create profiles for themselves
CREATE TABLE profiles (
    user_id integer PRIMARY KEY REFERENCES users(user_id),
    first_name varchar(50),
    last_name varchar(50),
    country varchar(100),
    city varchar(100),
);

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
