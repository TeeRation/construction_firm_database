CREATE TABLE building_material (
    building_id INTEGER NOT NULL,
    material_id INTEGER NOT NULL,
    required_quantity NUMERIC(12, 2) NOT NULL,

    CONSTRAINT pk_building_material
        PRIMARY KEY (building_id, material_id),

    CONSTRAINT fk_building_material_building
        FOREIGN KEY (building_id)
        REFERENCES building(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_building_material_material
        FOREIGN KEY (material_id)
        REFERENCES material(id),

    CONSTRAINT chk_building_material_quantity
        CHECK (required_quantity > 0)
);
