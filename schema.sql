DROP DATABASE IF EXISTS smart_clinic_db;
CREATE DATABASE smart_clinic_db;
USE smart_clinic_db;

CREATE TABLE persons (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male', 'Female') NOT NULL,
    birth_date DATE NOT NULL,
    address VARCHAR(200) NOT NULL
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    blood_type VARCHAR(5) NOT NULL,
    insurance_provider VARCHAR(100),
    emergency_contact VARCHAR(100) NOT NULL,
    CONSTRAINT fk_patients_person
        FOREIGN KEY (patient_id) REFERENCES persons(person_id)
        ON DELETE CASCADE
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    license_number VARCHAR(50) NOT NULL UNIQUE,
    specialty VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    consultation_fee DECIMAL(10, 2) NOT NULL CHECK (consultation_fee >= 0),
    CONSTRAINT fk_doctors_person
        FOREIGN KEY (doctor_id) REFERENCES persons(person_id)
        ON DELETE CASCADE
);

CREATE TABLE nurses (
    nurse_id INT PRIMARY KEY,
    shift_type ENUM('Morning', 'Evening', 'Night') NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_nurses_person
        FOREIGN KEY (nurse_id) REFERENCES persons(person_id)
        ON DELETE CASCADE
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    nurse_id INT,
    appointment_datetime DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Scheduled',
    visit_reason VARCHAR(200) NOT NULL,
    room_number VARCHAR(20) NOT NULL,
    CONSTRAINT fk_appointments_patient
        FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    CONSTRAINT fk_appointments_doctor
        FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    CONSTRAINT fk_appointments_nurse
        FOREIGN KEY (nurse_id) REFERENCES nurses(nurse_id)
);

CREATE TABLE treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    diagnosis VARCHAR(200) NOT NULL,
    procedure_name VARCHAR(150) NOT NULL,
    treatment_notes TEXT,
    follow_up_date DATE,
    CONSTRAINT fk_treatments_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
        ON DELETE CASCADE
);

CREATE TABLE medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL UNIQUE,
    dosage_form VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0)
);

CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    treatment_id INT NOT NULL,
    medicine_id INT NOT NULL,
    dosage_instructions VARCHAR(200) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    duration_days INT NOT NULL CHECK (duration_days > 0),
    CONSTRAINT fk_prescriptions_treatment
        FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_prescriptions_medicine
        FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
    payment_date DATE NOT NULL,
    payment_method ENUM('Cash', 'Card', 'Transfer') NOT NULL,
    payment_status ENUM('Paid', 'Pending', 'Refunded') NOT NULL,
    CONSTRAINT fk_payments_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
        ON DELETE CASCADE
);

CREATE VIEW patient_appointment_summary AS
SELECT
    a.appointment_id,
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_datetime,
    a.status,
    a.room_number
FROM appointments a
JOIN patients pt ON a.patient_id = pt.patient_id
JOIN persons p ON pt.patient_id = p.person_id
JOIN doctors dr ON a.doctor_id = dr.doctor_id
JOIN persons d ON dr.doctor_id = d.person_id;

DELIMITER $$

CREATE TRIGGER trg_reduce_medicine_stock
AFTER INSERT ON prescriptions
FOR EACH ROW
BEGIN
    UPDATE medicines
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE medicine_id = NEW.medicine_id;
END $$

DELIMITER ;
