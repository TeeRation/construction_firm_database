CREATE TABLE brigade_member (
    brigade_id INTEGER NOT NULL,
    worker_id INTEGER NOT NULL,

    CONSTRAINT pk_brigade_member
        PRIMARY KEY (brigade_id, worker_id),

    CONSTRAINT fk_brigade_member_brigade
        FOREIGN KEY (brigade_id)
        REFERENCES brigade(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_brigade_member_worker
        FOREIGN KEY (worker_id)
        REFERENCES worker(id)
        ON DELETE CASCADE
);
