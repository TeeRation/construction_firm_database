# Construction Firm Database

Учебный проект по дисциплине «Базы данных».

Тема курсовой работы: **«База данных строительной фирмы»**.

База данных предназначена для информационной поддержки руководителя строительной фирмы. В проекте учитываются здания, материалы, рабочие, специальности, бригады, состав бригад и график строительных работ.

## СУБД

Проект рассчитан на PostgreSQL.

Фактическую версию установленной СУБД перед оформлением отчета можно получить запросом:

```sql
SELECT version();
```

## Структура проекта

```text
docs/
└── uml/
    └── database_diagram.puml

queries/
├── 001_select_buildings.sql
├── 002_select_workers_by_specialty.sql
├── 003_schedule_by_date_range.sql
├── 004_calculate_brigade_duration.sql
├── 005_count_brigade_members.sql
└── 006_materials_for_building.sql

schema/
├── 000_drop_all_tables.sql
├── 001_create_building_type.sql
├── 002_create_building.sql
├── 003_create_material.sql
├── 004_create_building_material.sql
├── 005_create_specialty.sql
├── 006_create_worker.sql
├── 007_create_worker_specialty.sql
├── 008_create_brigade.sql
└── 009_create_brigade_member.sql

seed/
└── 001_seed_data.sql
```

## Таблицы базы данных

- `building_type` — типы зданий;
- `building` — строящиеся здания;
- `material` — строительные материалы;
- `building_material` — материалы и их требуемое количество для зданий;
- `specialty` — специальности рабочих;
- `worker` — рабочие строительной фирмы;
- `worker_specialty` — специальности, которыми владеют рабочие;
- `brigade` — бригады, назначенные на конкретные здания и этапы работ;
- `brigade_member` — состав бригад.

## Создание базы данных

Сначала создайте пустую базу данных PostgreSQL, например:

```sql
CREATE DATABASE construction_firm_database;
```

Подключитесь к созданной базе и выполните SQL-файлы из каталога `schema` строго по порядку от `001` до `009`.

Если структуру требуется пересоздать, сначала выполните:

```text
schema/000_drop_all_tables.sql
```

После создания таблиц загрузите демонстрационные данные:

```text
seed/001_seed_data.sql
```

Данные в seed-файле являются вымышленными и используются только для проверки работы учебной базы данных.

## Запросы

В каталоге `queries` находятся запросы, необходимые для проверки функций базы данных:

1. `001_select_buildings.sql` — простая выборка зданий;
2. `002_select_workers_by_specialty.sql` — выборка рабочих по условию;
3. `003_schedule_by_date_range.sql` — график работ за диапазон дат;
4. `004_calculate_brigade_duration.sql` — вычисление продолжительности работ;
5. `005_count_brigade_members.sql` — агрегатный запрос с подсчетом работников;
6. `006_materials_for_building.sql` — материалы и их количество для выбранного здания.

В запросах с условиями используются идентификаторы из демонстрационных данных. Для проверки других объектов значения в `WHERE` можно заменить.

## ER-схема

Исходный код диаграммы находится в:

```text
docs/uml/database_diagram.puml
```

Файл можно открыть расширением PlantUML для Visual Studio Code и экспортировать в PNG для вставки в отчет.

## Проверка

После создания таблиц и загрузки тестовых данных последовательно запустите файлы из `queries`. Все запросы должны выполняться без изменения структуры базы данных.
