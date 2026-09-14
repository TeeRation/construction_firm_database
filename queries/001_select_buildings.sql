-- 1. Simple selection: list of buildings.
SELECT
    b.id,
    b.name AS building_name,
    bt.name AS building_type
FROM building AS b
JOIN building_type AS bt
    ON bt.id = b.building_type_id
ORDER BY b.id;
