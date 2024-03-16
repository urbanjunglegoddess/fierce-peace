-- Create schema for Big Biz District
CREATE SCHEMA big_biz_district;

-- Connect to the big_biz_district schema
\c my_app
SET search_path TO big_biz_district;

-- Businesses table
CREATE TABLE businesses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(100),
  address VARCHAR(255),
  city VARCHAR(100),
  state VARCHAR(100),
  zip VARCHAR(20),
  phone VARCHAR(20),
  website VARCHAR(255),
  logo_url VARCHAR(255),
  cover_photo_url VARCHAR(255),
  owner_id INTEGER REFERENCES users(id)
);

-- Users table
-- (for storing business owners & customers)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(320) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  join_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Products table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  business_id INTEGER REFERENCES businesses(id),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(100),
  price NUMERIC(10,2) CHECK (price > 0),
  qty_available INTEGER DEFAULT 0,
  featured BOOLEAN DEFAULT false
);

-- Reviews Table
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  text TEXT NOT NULL,
  rating SMALLINT CHECK (rating >= 1 AND rating <= 5),
  business_id INTEGER REFERENCES businesses(id),
  user_id INTEGER REFERENCES users(id),
  created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  total_amount NUMERIC(10,2) CHECK (total_amount > 0),
  placed_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Order items table
-- (links orders to specific products)
CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INTEGER REFERENCES orders(id),
  product_id INTEGER REFERENCES products(id),
  qty INTEGER NOT NULL CHECK (qty > 0),
  item_price NUMERIC(10,2) NOT NULL
);

-- Job Postings
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100),
    location VARCHAR(255),
    salary NUMERIC(10,2),
    contact_email VARCHAR(320),
    is_active BOOLEAN DEFAULT TRUE
);

-- Freelancer Listings
CREATE TABLE freelancers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    title VARCHAR(255),
    description TEXT,
    skills TEXT[],
    hourly_rate NUMERIC(10,2),
    profile_url VARCHAR(255),
    contact_email VARCHAR(320)
);

-- Real Estate Listings
CREATE TABLE real_estate (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(255),
    description TEXT,
    location VARCHAR(255),
    property_type VARCHAR(100),
    sale_price NUMERIC(10,2),
    rental_price NUMERIC(10,2),
    is_rental BOOLEAN,
    photo_url VARCHAR(255)
);

-- Promotions
CREATE TABLE promotions (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    name VARCHAR(255),
    description TEXT,
    discount NUMERIC(4,2),
    start_date DATE,
    end_date DATE
);

-- Payments
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    order_id INTEGER REFERENCES orders(id),
    amount NUMERIC(10,2) NOT NULL,
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    provider VARCHAR(50)
);

-- Shopping Cart
CREATE TABLE shopping_carts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  total_price NUMERIC(10,2) DEFAULT 0 CHECK (total_price >= 0),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Shopping Cart Items
CREATE TABLE cart_items (
  id SERIAL PRIMARY KEY,
  cart_id INTEGER REFERENCES shopping_carts(id) ON DELETE CASCADE,
  product_id INTEGER REFERENCES products(id),
  qty INTEGER NOT NULL DEFAULT 1 CHECK (qty > 0),
  price NUMERIC(10,2) NOT NULL CHECK (price > 0)
);


-- Wishlists
CREATE TABLE wishlists (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  name VARCHAR(255) NOT NULL
);

-- Wishlist Items
CREATE TABLE wishlist_items (
  wishlist_id INTEGER REFERENCES wishlists(id) ON DELETE CASCADE,
  product_id INTEGER REFERENCES products(id),
  added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (wishlist_id, product_id)
);


-- Business Events
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  business_id INTEGER REFERENCES businesses(id),
  name VARCHAR(255) NOT NULL,
  event_type VARCHAR(100),
  start_date DATE,
  start_time TIME,
  end_date DATE,
  end_time TIME,
  description TEXT,
  location VARCHAR(255),
  registration_link VARCHAR(255)
);

-- Blog/Articles
CREATE TABLE blog_posts (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(255) NOT NULL,
    summary VARCHAR(500),
    content TEXT NOT NULL,
    feature_image VARCHAR(255),
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Videos
CREATE TABLE videos (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    video_url VARCHAR(255) NOT NULL,
    thumbnail_url VARCHAR(255)
);

-- Business Photos
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    title VARCHAR(100),
    url VARCHAR(255) NOT NULL,
    description VARCHAR(500)
);

-- Testimonials
CREATE TABLE testimonials (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    customer_name VARCHAR(255) NOT NULL,
    photo_url VARCHAR(255),
    text TEXT NOT NULL
);

-- FAQs
CREATE TABLE faqs (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    question TEXT NOT NULL,
    answer TEXT NOT NULL
);

-- Page Views
CREATE TABLE page_views (
    id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    user_id INTEGER REFERENCES users(id),
    viewed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Email Subscribers
CREATE TABLE subscribers (
    id SERIAL PRIMARY KEY,
    email VARCHAR(320) NOT NULL UNIQUE,
    subscribed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Newsletters
CREATE TABLE newsletters (
    id SERIAL PRIMARY KEY,
    subject VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    sent_at TIMESTAMP
);

-- Email Campaigns
CREATE TABLE campaigns (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    recipient_group VARCHAR(100) NOT NULL,
    scheduled_for TIMESTAMP
);


-- Ads
CREATE TABLE ads (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    url VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    start_date DATE,
    end_date DATE
);

