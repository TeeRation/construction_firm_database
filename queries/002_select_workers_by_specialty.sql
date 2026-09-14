-- 2. Selection with a condition:
-- workers of the selected specialty assigned to brigades of the selected building.
-- Change the values in the WHERE clause if another building/specialty is required.
SELECT DISTINCT
    w.id,
    w.full_name,
    w.personal_number,
    s.name AS specialty,
    b.name AS building_name
FROM worker AS w
JOIN worker_specialty AS ws
    ON ws.worker_id = w.id
JOIN specialty AS s
    ON s.id = ws.specialty_id
JOIN brigade_member AS bm
    ON bm.worker_id = w.id
JOIN brigade AS br
    ON br.id = bm.brigade_id
JOIN building AS b
    ON b.id = br.building_id
WHERE b.id = 1
  AND s.id = 3
ORDER BY w.full_name;
