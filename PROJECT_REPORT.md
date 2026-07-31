# Smart Clinic Database System Report

## 1. Objective

The objective of this project is to design and implement a complete relational database system for a private clinic using MySQL. The project demonstrates understanding of ER/EER modeling, relational mapping, SQL implementation, and advanced SQL operations.

## 2. Introduction

A private clinic currently stores patient information manually, which creates difficulty in organizing appointments, treatments, and payments. To solve this issue, this project proposes a Smart Clinic Database System that improves data organization, consistency, and retrieval. The system was designed using database concepts covered in class and implemented using MySQL.

## 3. Selected Problem

The selected topic is the design and implementation of a Smart Clinic Database System. The database must support day-to-day clinic operations by storing patient, doctor, nurse, appointment, treatment, medicine, prescription, and payment information in a structured relational form.

## 4. Database Design

### Main Entities

The database contains the following entities:

- `persons`
- `patients`
- `doctors`
- `nurses`
- `appointments`
- `treatments`
- `medicines`
- `prescriptions`
- `payments`

### EER Feature

The EER feature used in this project is specialization/generalization:

- `persons` is the supertype
- `patients`, `doctors`, and `nurses` are subtypes

This allows shared person data to be stored once while role-specific attributes are stored in subtype tables.

### Relationships

- One patient can have many appointments.
- One doctor can handle many appointments.
- One nurse can assist many appointments.
- One appointment can generate one treatment record.
- One treatment can have many prescriptions.
- One medicine can appear in many prescriptions.
- One appointment can generate one or more payments.

## 5. Database Implementation

The database was implemented in MySQL and includes:

- `CREATE DATABASE`
- creation of all required tables
- primary keys and foreign keys
- constraints such as `NOT NULL`, `UNIQUE`, and `CHECK`
- insertion of at least five records into each main table
- one view
- one trigger

## 6. SQL Operations

The project includes the following SQL tasks:

- simple `SELECT` statements
- `JOIN` queries
- nested queries
- aggregate functions with `GROUP BY`
- `UPDATE` statements
- `DELETE` statements
- one `VIEW`
- one `TRIGGER`

These operations are stored in `queries.sql` with a brief explanation above each query.

## 7. View and Trigger

### View

`patient_appointment_summary` was created to simplify retrieval of appointment information with patient and doctor names in one result.

### Trigger

`trg_reduce_medicine_stock` was created to automatically reduce the stock of a medicine after inserting a prescription.

## 8. Assumptions

1. A person belongs to one role in the inserted sample data.
2. A treatment is linked to one appointment only.
3. Nurse assignment for an appointment is optional.
4. Medicine stock values are positive and decrease when prescriptions are inserted.
5. Sample payments use one payment per appointment, even though the design allows more.

## 9. Testing

The SQL files were prepared to be executed in MySQL in this order:

1. `schema.sql`
2. `seed_data.sql`
3. `queries.sql`

The current machine did not have the MySQL CLI available in PATH during preparation, so the project files were prepared as a ready-to-run MySQL package. The schema, inserts, and queries were written in MySQL syntax for direct execution in a MySQL environment.

## 10. Project Artifacts

Project Artifacts:

- Live report document (with edit history): [Add Word Online or Google Docs link here]
- GitHub repository (with commit history): [Add repository link here]
- SQL files: stored in the project folder

## 11. Conclusion

This project demonstrates how a real clinic workflow can be modeled as a relational database. By combining ER/EER concepts with SQL implementation, the design supports data accuracy, efficient retrieval, and maintainable relationships between clinic operations such as appointments, treatments, prescriptions, and payments.
