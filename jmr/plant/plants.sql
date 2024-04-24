CREATE SCHEMA plants;

CREATE TABLE plant (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) ,
    description TEXT,
    plant_type_id INT ,
    plant_food_type_id INT ,
    FOREIGN KEY (plant_type_id) REFERENCES plant_type(id),
    FOREIGN KEY (herb_food_type_id) REFERENCES herb_food_type(id)
);
CREATE TABLE plant_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE plant_care (
    id SERIAL PRIMARY KEY,
    plant_id INT ,
    care_type_id INT ,
    care_description TEXT NOT NULL,
    FOREIGN KEY (plant_id) REFERENCES plant(id),
    FOREIGN KEY (care_type_id) REFERENCES care_type(id)
);


