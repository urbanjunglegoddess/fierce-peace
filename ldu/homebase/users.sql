-- SCHEMA: homebase

-- DROP SCHEMA IF EXISTS homebase ;

CREATE SCHEMA IF NOT EXISTS homebase
    AUTHORIZATION postgres;
	
	
	CREATE TABLE users(
    user_id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    first_name varchar(50),
    last_name varchar(50),
    city varchar(100),
	state varchar(100),
	country varchar(100),
    email varchar(100) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
	language varchar(100),
	sec_language varchar(100),
	other_languages text,
	gender varchar(50),
    joined_date date NOT NULL
	); 
	