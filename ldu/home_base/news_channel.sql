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