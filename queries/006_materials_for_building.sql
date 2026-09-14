-- Additional query required by the subject area:
-- materials and required quantities for the selected building.
SELECT
    b.name AS building_name,
    m.name AS material_name,
    bm.required_quantity,
    m.unit
FROM building_material AS bm
JOIN building AS b
    ON b.id = bm.building_id
JOIN material AS m
    ON m.id = bm.material_id
WHERE b.id = 1
ORDER BY m.name;
