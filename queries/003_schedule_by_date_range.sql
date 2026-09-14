-- 3. Date range query:
-- work schedule for a selected building in the specified period.
SELECT
    br.id AS brigade_id,
    br.stage_name,
    s.name AS brigade_specialty,
    w.full_name AS foreman,
    br.start_date,
    br.end_date
FROM brigade AS br
JOIN specialty AS s
    ON s.id = br.specialty_id
JOIN worker AS w
    ON w.id = br.foreman_worker_id
WHERE br.building_id = 1
  AND br.start_date <= DATE '2026-09-30'
  AND br.end_date >= DATE '2026-09-01'
ORDER BY br.start_date;
