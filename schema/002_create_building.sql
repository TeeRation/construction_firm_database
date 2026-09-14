CREATE TABLE building (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    building_type_id INTEGER NOT NULL,
    CONSTRAINT fk_building_type
        FOREIGN KEY (building_type_id)
        REFERENCES building_type(id)
);
