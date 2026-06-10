CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    age INTEGER NOT NULL CHECK (age > 0),
    phone_number CHAR(10) NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(250),
    recipe TEXT,
    price NUMERIC(10, 2) NOT NULL CHECK (price > 0)
);

CREATE TABLE distributors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    address VARCHAR(30) NOT NULL,
    summary VARCHAR(200) NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200),
    country_id INTEGER NOT NULL REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE,
    distributor_id INTEGER NOT NULL REFERENCES distributors(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE feedbacks (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255),
    rate NUMERIC(4, 2) CHECK (rate BETWEEN 0 AND 10),
    product_id INTEGER NOT NULL REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE,
    customer_id INTEGER NOT NULL REFERENCES customers(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE products_ingredients (
    product_id INTEGER REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE,
    ingredient_id INTEGER REFERENCES ingredients(id) ON UPDATE CASCADE ON DELETE CASCADE
);