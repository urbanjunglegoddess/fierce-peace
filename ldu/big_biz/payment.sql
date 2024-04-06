-- Payments
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    order_id INTEGER REFERENCES orders(id),
    amount NUMERIC(10,2) NOT NULL,
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    provider VARCHAR(50)
);

-- Purchase Transactions
CREATE TABLE purchases (
    purchase_id serial PRIMARY KEY,
    user_id integer REFERENCES users(user_id),
    product_id integer, -- references products table
    purchase_date date NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_method varchar(100) NOT NULL
);