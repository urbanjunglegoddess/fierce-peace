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