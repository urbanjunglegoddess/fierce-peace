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