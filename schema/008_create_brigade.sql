CREATE TABLE brigade (
    id SERIAL PRIMARY KEY,
    building_id INTEGER NOT NULL,
    specialty_id INTEGER NOT NULL,
    stage_name VARCHAR(150) NOT NULL,
    foreman_worker_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    CONSTRAINT fk_brigade_building
        FOREIGN KEY (building_id)
        REFERENCES building(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_brigade_specialty
        FOREIGN KEY (specialty_id)
        REFERENCES specialty(id),

    CONSTRAINT fk_brigade_foreman
        FOREIGN KEY (foreman_worker_id)
        REFERENCES worker(id),

    CONSTRAINT chk_brigade_dates
        CHECK (end_date >= start_date)
);
