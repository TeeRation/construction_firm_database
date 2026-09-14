\set ON_ERROR_STOP on
\encoding UTF8

\ir ../schema/000_drop_all_tables.sql
\ir ../schema/001_create_building_type.sql
\ir ../schema/002_create_building.sql
\ir ../schema/003_create_material.sql
\ir ../schema/004_create_building_material.sql
\ir ../schema/005_create_specialty.sql
\ir ../schema/006_create_worker.sql
\ir ../schema/007_create_worker_specialty.sql
\ir ../schema/008_create_brigade.sql
\ir ../schema/009_create_brigade_member.sql
\ir ../seed/001_seed_data.sql

\encoding WIN1251
