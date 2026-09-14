-- 5. Aggregate query:
-- number of workers in each brigade for the selected building.
SELECT
    br.id AS brigade_id,
    br.stage_name,
    s.name AS brigade_specialty,
    COUNT(bm.worker_id) AS worker_count
FROM brigade AS br
JOIN specialty AS s
    ON s.id = br.specialty_id
LEFT JOIN brigade_member AS bm
    ON bm.brigade_id = br.id
WHERE br.building_id = 1
GROUP BY
    br.id,
    br.stage_name,
    s.name,
    br.start_date
ORDER BY br.start_date;
