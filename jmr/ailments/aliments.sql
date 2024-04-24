
CREATE  SCHEMA supplements (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
    );

CREATE SCHEMA amino_acids (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
    );

CREATE SCHEMA vitamins (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
    );

CREATE SCHEMA minerals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
    );

CREATE SCHEMA glandulars (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    benefits TEXT,
    side_effects TEXT
    );

CREATE SCHEMA tissue_salts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    benefits TEXT,
    side_effects TEXT
    );

CREATE SCHEMA ailments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    other_names TEXT,
    description TEXT,
    symptoms TEXT,
    treatment TEXT
    );