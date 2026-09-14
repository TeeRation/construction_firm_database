-- Test data for demonstrating the course database.
-- The names and values below are fictional and are not data of a real company.

INSERT INTO building_type (name) VALUES
    ('Многоквартирный жилой дом'),
    ('Административное здание'),
    ('Складское здание');

INSERT INTO building (name, building_type_id) VALUES
    ('Жилой дом № 1', 1),
    ('Административный корпус', 2),
    ('Склад № 1', 3);

INSERT INTO material (name, unit) VALUES
    ('Бетон', 'м3'),
    ('Арматура', 'т'),
    ('Кирпич', 'шт'),
    ('Штукатурная смесь', 'кг'),
    ('Цемент', 'кг'),
    ('Газобетонный блок', 'шт');

INSERT INTO building_material (building_id, material_id, required_quantity) VALUES
    (1, 1, 850.00),
    (1, 2, 95.00),
    (1, 3, 42000.00),
    (1, 4, 7600.00),
    (2, 1, 430.00),
    (2, 2, 52.00),
    (2, 6, 14500.00),
    (2, 4, 3900.00),
    (3, 1, 280.00),
    (3, 2, 31.00),
    (3, 5, 2400.00);

INSERT INTO specialty (name) VALUES
    ('Арматурщик'),
    ('Бетонщик'),
    ('Каменщик'),
    ('Штукатур'),
    ('Монтажник');

INSERT INTO worker (full_name, personal_number) VALUES
    ('Иванов Сергей Петрович', 'W001'),
    ('Петров Алексей Николаевич', 'W002'),
    ('Сидоров Михаил Андреевич', 'W003'),
    ('Кузнецов Илья Олегович', 'W004'),
    ('Смирнов Павел Викторович', 'W005'),
    ('Волков Дмитрий Сергеевич', 'W006'),
    ('Морозов Антон Игоревич', 'W007'),
    ('Федоров Роман Евгеньевич', 'W008');

INSERT INTO worker_specialty (worker_id, specialty_id) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2),
    (3, 5),
    (4, 3),
    (5, 3),
    (5, 4),
    (6, 4),
    (7, 5),
    (8, 2),
    (8, 3);

INSERT INTO brigade (
    building_id,
    specialty_id,
    stage_name,
    foreman_worker_id,
    start_date,
    end_date
) VALUES
    (1, 1, 'Армирование фундамента', 1, '2026-09-01', '2026-09-10'),
    (1, 2, 'Бетонирование фундамента', 3, '2026-09-11', '2026-09-18'),
    (1, 3, 'Кладка наружных стен', 4, '2026-09-19', '2026-10-05'),
    (2, 5, 'Монтаж конструкций', 7, '2026-10-06', '2026-10-21'),
    (3, 2, 'Устройство бетонного пола', 8, '2026-10-22', '2026-11-01');

INSERT INTO brigade_member (brigade_id, worker_id) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 3),
    (2, 8),
    (3, 4),
    (3, 5),
    (3, 8),
    (4, 3),
    (4, 7),
    (5, 3),
    (5, 8);
