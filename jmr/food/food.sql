CREATE SCHEMA food;

CREATE TABLE fruit(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    description TEXT ,
    scientific_name VARCHAR(250) ,
    other_names VARCHAR(250) ,
    origin_region VARCHAR(100) ,
    type VARCHAR(100)  foreign key references herb_types(type)
);