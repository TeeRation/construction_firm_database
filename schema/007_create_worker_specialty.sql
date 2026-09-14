CREATE TABLE worker_specialty (
    worker_id INTEGER NOT NULL,
    specialty_id INTEGER NOT NULL,

    CONSTRAINT pk_worker_specialty
        PRIMARY KEY (worker_id, specialty_id),

    CONSTRAINT fk_worker_specialty_worker
        FOREIGN KEY (worker_id)
        REFERENCES worker(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_worker_specialty_specialty
        FOREIGN KEY (specialty_id)
        REFERENCES specialty(id)
        ON DELETE CASCADE
);
