CREATE TABLE worker (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    personal_number VARCHAR(30) NOT NULL UNIQUE
);
