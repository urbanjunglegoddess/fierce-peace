-- FAQs
CREATE TABLE faqs (
    id SERIAL PRIMARY KEY,
    business_id INTEGER REFERENCES businesses(id),
    question TEXT NOT NULL,
    answer TEXT NOT NULL
);