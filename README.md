# Smart Clinic Database System

This project contains the design and implementation files for a MySQL-based Smart Clinic Database System.

## Contents

- `schema.sql`: database creation, tables, constraints, view, and trigger
- `seed_data.sql`: sample data with at least five rows in each main table
- `queries.sql`: required SQL operations with short descriptions
- `PROJECT_REPORT.md`: full project report
- `MID_PROGRESS_REPORT.md`: short progress report
- `ER_EER_DIAGRAM.md`: ER/EER diagram and design assumptions

## How to Run

1. Open MySQL.
2. Run `schema.sql`.
3. Run `seed_data.sql`.
4. Run `queries.sql`.

## Notes

- The design includes more than six entities.
- The EER feature used is specialization/generalization through the `persons` supertype and the `patients`, `doctors`, and `nurses` subtypes.
- The project was prepared for MySQL syntax.
