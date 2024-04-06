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
