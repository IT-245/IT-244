# ER/EER Diagram and Assumptions

## EER Structure

The design uses `persons` as a supertype and the following subtypes:

- `patients`
- `doctors`
- `nurses`

This represents a specialization/generalization feature because every patient, doctor, and nurse is a person, but each subtype stores additional attributes specific to its role.

## Mermaid ER Diagram

```mermaid
erDiagram
    PERSONS ||--o| PATIENTS : is_a
    PERSONS ||--o| DOCTORS : is_a
    PERSONS ||--o| NURSES : is_a
    PATIENTS ||--o{ APPOINTMENTS : books
    DOCTORS ||--o{ APPOINTMENTS : handles
    NURSES ||--o{ APPOINTMENTS : assists
    APPOINTMENTS ||--|| TREATMENTS : produces
    TREATMENTS ||--o{ PRESCRIPTIONS : contains
    MEDICINES ||--o{ PRESCRIPTIONS : appears_in
    APPOINTMENTS ||--o{ PAYMENTS : generates

    PERSONS {
        int person_id PK
        varchar full_name
        varchar phone
        varchar email
        enum gender
        date birth_date
        varchar address
    }

    PATIENTS {
        int patient_id PK, FK
        varchar blood_type
        varchar insurance_provider
        varchar emergency_contact
    }

    DOCTORS {
        int doctor_id PK, FK
        varchar license_number
        varchar specialty
        date hire_date
        decimal consultation_fee
    }

    NURSES {
        int nurse_id PK, FK
        enum shift_type
        date hire_date
    }

    APPOINTMENTS {
        int appointment_id PK
        int patient_id FK
        int doctor_id FK
        int nurse_id FK
        datetime appointment_datetime
        enum status
        varchar visit_reason
        varchar room_number
    }

    TREATMENTS {
        int treatment_id PK
        int appointment_id FK
        varchar diagnosis
        varchar procedure_name
        text treatment_notes
        date follow_up_date
    }

    MEDICINES {
        int medicine_id PK
        varchar medicine_name
        varchar dosage_form
        decimal unit_price
        int stock_quantity
    }

    PRESCRIPTIONS {
        int prescription_id PK
        int treatment_id FK
        int medicine_id FK
        varchar dosage_instructions
        int quantity
        int duration_days
    }

    PAYMENTS {
        int payment_id PK
        int appointment_id FK
        decimal amount
        date payment_date
        enum payment_method
        enum payment_status
    }
```

## Assumptions

1. A person may belong to only one subtype in this project data set.
2. Each appointment belongs to one patient and one doctor, while nurse assignment is optional.
3. Each appointment has at most one treatment record.
4. A treatment may include multiple prescribed medicines.
5. An appointment may have one or more payment records, although the sample data uses one payment per appointment.
6. The stock of a medicine decreases automatically when a prescription is inserted.
