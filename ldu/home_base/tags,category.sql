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