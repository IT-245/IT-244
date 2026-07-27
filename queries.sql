USE smart_clinic_db;

-- SELECT statement
-- Purpose: Display all patients and their insurance providers.
SELECT patient_id, blood_type, insurance_provider, emergency_contact
FROM patients;

-- JOIN query
-- Purpose: Retrieve appointment details with patient and doctor names.
SELECT
    a.appointment_id,
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_datetime,
    a.status
FROM appointments a
JOIN persons p ON a.patient_id = p.person_id
JOIN persons d ON a.doctor_id = d.person_id;

-- Nested query
-- Purpose: Find doctors whose consultation fee is above the average consultation fee.
SELECT doctor_id, specialty, consultation_fee
FROM doctors
WHERE consultation_fee > (
    SELECT AVG(consultation_fee)
    FROM doctors
);

-- Aggregate with GROUP BY
-- Purpose: Count how many appointments each doctor handled.
SELECT
    a.doctor_id,
    p.full_name AS doctor_name,
    COUNT(*) AS total_appointments
FROM appointments a
JOIN persons p ON a.doctor_id = p.person_id
GROUP BY a.doctor_id, p.full_name;

-- UPDATE statement
-- Purpose: Update the status of a scheduled payment once it has been paid.
UPDATE payments
SET payment_status = 'Paid', payment_method = 'Transfer'
WHERE payment_id = 4;

-- DELETE statement
-- Purpose: Remove a cancelled or test appointment if needed.
DELETE FROM appointments
WHERE appointment_id = 5
  AND status = 'Cancelled';

-- VIEW query
-- Purpose: Display the summary view for appointments with patient and doctor names.
SELECT *
FROM patient_appointment_summary;

-- TRIGGER test
-- Purpose: Insert a prescription row and let the trigger reduce medicine stock automatically.
INSERT INTO prescriptions (treatment_id, medicine_id, dosage_instructions, quantity, duration_days)
VALUES (5, 1, 'Take one tablet after dinner.', 3, 3);

SELECT medicine_id, medicine_name, stock_quantity
FROM medicines
WHERE medicine_id = 1;
