USE smart_clinic_db;

INSERT INTO persons (person_id, full_name, phone, email, gender, birth_date, address) VALUES
(1, 'Aisha Ahmed', '0501000001', 'aisha.ahmed@email.com', 'Female', '1998-02-14', 'Riyadh'),
(2, 'Sara Nasser', '0501000002', 'sara.nasser@email.com', 'Female', '1995-07-22', 'Jeddah'),
(3, 'Omar Ali', '0501000003', 'omar.ali@email.com', 'Male', '1989-11-05', 'Dammam'),
(4, 'Huda Salem', '0501000004', 'huda.salem@email.com', 'Female', '2001-03-18', 'Riyadh'),
(5, 'Fahad Khalid', '0501000005', 'fahad.khalid@email.com', 'Male', '1993-12-09', 'Khobar'),
(6, 'Dr. Reem Hassan', '0501000006', 'reem.hassan@clinic.com', 'Female', '1980-01-10', 'Riyadh'),
(7, 'Dr. Majed Noor', '0501000007', 'majed.noor@clinic.com', 'Male', '1978-06-29', 'Jeddah'),
(8, 'Dr. Lina Adel', '0501000008', 'lina.adel@clinic.com', 'Female', '1985-09-16', 'Dammam'),
(9, 'Dr. Sami Youssef', '0501000009', 'sami.youssef@clinic.com', 'Male', '1982-04-03', 'Riyadh'),
(10, 'Dr. Nada Karim', '0501000010', 'nada.karim@clinic.com', 'Female', '1987-05-21', 'Khobar'),
(11, 'Nurse Amal Faris', '0501000011', 'amal.faris@clinic.com', 'Female', '1991-08-17', 'Riyadh'),
(12, 'Nurse Mona Saad', '0501000012', 'mona.saad@clinic.com', 'Female', '1990-10-08', 'Jeddah'),
(13, 'Nurse Talal Eid', '0501000013', 'talal.eid@clinic.com', 'Male', '1992-12-15', 'Dammam'),
(14, 'Nurse Haneen Ashraf', '0501000014', 'haneen.ashraf@clinic.com', 'Female', '1994-01-28', 'Riyadh'),
(15, 'Nurse Yara Adel', '0501000015', 'yara.adel@clinic.com', 'Female', '1996-07-30', 'Khobar');

INSERT INTO patients (patient_id, blood_type, insurance_provider, emergency_contact) VALUES
(1, 'A+', 'Bupa', 'Mona Ahmed'),
(2, 'O+', 'Tawuniya', 'Nasser Salem'),
(3, 'B-', 'MedGulf', 'Ali Omar'),
(4, 'AB+', 'None', 'Salem Huda'),
(5, 'O-', 'Bupa', 'Khalid Fahad');

INSERT INTO doctors (doctor_id, license_number, specialty, hire_date, consultation_fee) VALUES
(6, 'DOC-1001', 'Dermatology', '2022-01-15', 250.00),
(7, 'DOC-1002', 'Cardiology', '2021-09-01', 400.00),
(8, 'DOC-1003', 'Pediatrics', '2023-02-12', 220.00),
(9, 'DOC-1004', 'Orthopedics', '2020-11-20', 350.00),
(10, 'DOC-1005', 'General Medicine', '2024-03-05', 180.00);

INSERT INTO nurses (nurse_id, shift_type, hire_date) VALUES
(11, 'Morning', '2023-01-09'),
(12, 'Evening', '2022-06-11'),
(13, 'Night', '2021-08-19'),
(14, 'Morning', '2024-02-07'),
(15, 'Evening', '2023-09-18');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, nurse_id, appointment_datetime, status, visit_reason, room_number) VALUES
(1, 1, 10, 11, '2026-07-20 09:00:00', 'Completed', 'Fever and fatigue', 'A101'),
(2, 2, 7, 12, '2026-07-21 11:00:00', 'Completed', 'Chest pain follow-up', 'B201'),
(3, 3, 9, 13, '2026-07-23 14:30:00', 'Completed', 'Knee pain', 'C301'),
(4, 4, 6, 14, '2026-07-25 10:15:00', 'Scheduled', 'Skin rash', 'A103'),
(5, 5, 8, 15, '2026-07-27 16:00:00', 'Completed', 'Child vaccination review', 'D110');

INSERT INTO treatments (treatment_id, appointment_id, diagnosis, procedure_name, treatment_notes, follow_up_date) VALUES
(1, 1, 'Seasonal flu', 'General consultation', 'Patient advised to rest and hydrate.', '2026-07-27'),
(2, 2, 'Mild arrhythmia', 'ECG review', 'Monitor heart rate and reduce caffeine intake.', '2026-08-04'),
(3, 3, 'Ligament strain', 'Knee examination', 'Use brace for one week and avoid running.', '2026-07-30'),
(4, 4, 'Allergic dermatitis', 'Skin evaluation', 'Apply cream twice daily for seven days.', '2026-08-01'),
(5, 5, 'Vaccination schedule check', 'Pediatric review', 'No concerns, continue scheduled vaccinations.', '2026-08-03');

INSERT INTO medicines (medicine_id, medicine_name, dosage_form, unit_price, stock_quantity) VALUES
(1, 'Paracetamol', 'Tablet', 8.50, 200),
(2, 'Hydrocortisone Cream', 'Cream', 18.00, 80),
(3, 'Ibuprofen', 'Tablet', 12.00, 150),
(4, 'Vitamin C Syrup', 'Syrup', 15.00, 60),
(5, 'Aspirin', 'Tablet', 10.00, 90);

INSERT INTO prescriptions (prescription_id, treatment_id, medicine_id, dosage_instructions, quantity, duration_days) VALUES
(1, 1, 1, 'Take one tablet every 8 hours after food.', 10, 5),
(2, 2, 5, 'Take one tablet daily after breakfast.', 14, 14),
(3, 3, 3, 'Take one tablet every 12 hours if pain persists.', 8, 4),
(4, 4, 2, 'Apply to affected area twice daily.', 2, 7),
(5, 5, 4, 'Take 5 ml once daily.', 1, 5);

INSERT INTO payments (payment_id, appointment_id, amount, payment_date, payment_method, payment_status) VALUES
(1, 1, 180.00, '2026-07-20', 'Card', 'Paid'),
(2, 2, 400.00, '2026-07-21', 'Transfer', 'Paid'),
(3, 3, 350.00, '2026-07-23', 'Cash', 'Paid'),
(4, 4, 250.00, '2026-07-25', 'Card', 'Pending'),
(5, 5, 220.00, '2026-07-27', 'Card', 'Paid');
