-- 4. Calculated query:
-- duration of each brigade's work in calendar days.
SELECT
    br.id AS brigade_id,
    b.name AS building_name,
    br.stage_name,
    br.start_date,
    br.end_date,
    (br.end_date - br.start_date + 1) AS duration_days
FROM brigade AS br
JOIN building AS b
    ON b.id = br.building_id
ORDER BY br.start_date;
