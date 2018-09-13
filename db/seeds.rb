# frozen_string_literal: true

Specialty.create!(name: "Allergy and Immunology")
Specialty.create!(name: "Anesthesiology")
Specialty.create!(name: "Colon and Rectal Surgery")
Specialty.create!(name: "Dermatology")
Specialty.create!(name: "Emergency Medicine")
Specialty.create!(name: "Family Medicine")
Specialty.create!(name: "Internal Medicine")
Specialty.create!(name: "Medical Genetics and Genomics")
Specialty.create!(name: "Neurological Surgery")
Specialty.create!(name: "Neurology")
Specialty.create!(name: "Nuclear Medicine")
Specialty.create!(name: "Obstetrics and Gynecology")
Specialty.create!(name: "Ophthalmology")
Specialty.create!(name: "Orthopaedic Surgery")
Specialty.create!(name: "Otolaryngology")
Specialty.create!(name: "Pathology")
Specialty.create!(name: "Pediatrics")
Specialty.create!(name: "Physical Medicine & Rehabilitation")
Specialty.create!(name: "Plastic Surgery")
Specialty.create!(name: "Preventive Medicine")
Specialty.create!(name: "Psychiatry")
Specialty.create!(name: "Radiology")
Specialty.create!(name: "General Surgery")
Specialty.create!(name: "Thoracic Surgery")
Specialty.create!(name: "Urology")

doctor1 = Doctor.create!(first_name: "Stuart",
                         last_name: "Krigel",
                         location_city: "San Jose, CA",
                         years_in_practice: 29,
                         specialty_id: 21)
Doctor.create!(first_name: "Andre",
               last_name: "Young",
               location_city: "Compton, CA",
               years_in_practice: 30,
               specialty_id: 10)
Doctor.create!(first_name: "John",
               last_name: "Doolittle",
               location_city:
                         "Los Angeles, CA",
               years_in_practice: 40,
               specialty_id: 6)
Doctor.create!(first_name: "Henry",
               last_name: "Jekyll",
               location_city: "London, UK",
               years_in_practice: 14,
               specialty_id: 23)
Doctor.create!(first_name: "Alexander",
               last_name: "Ellenberg",
               location_city: "Stockton, CA",
               years_in_practice: 44,
               specialty_id: 19)
Doctor.create!(first_name: "Brenda",
               last_name: "Barrata",
               location_city: "Rochester, NY",
               years_in_practice: 29,
               specialty_id: 21)

patient1 = Patient.create!(first_name: "William",
                           last_name: "Burr")
Patient.create!(first_name: "Christopher",
                last_name: "Rock")
Patient.create!(first_name: "David",
                last_name: "Chappelle")
Patient.create!(first_name: "Jim",
                last_name: "Jefferies")
Patient.create!(first_name: "Louis",
                last_name: "C.K.")
Patient.create!(first_name: "Iliza",
                last_name: "Schlesinger")
Patient.create!(first_name: "Amy",
                last_name: "Schumer")

Ailment.create!(description: "sore leg muscle",
                first_noticed_on: Date.new(2017, 10, 14),
                patient_id: 1)
Ailment.create!(description: "the itis",
                first_noticed_on: Date.new(2018, 7, 19),
                patient_id: 2)
Ailment.create!(description: "social anxiety",
                first_noticed_on: Date.new(2017, 11, 30),
                patient_id: 3)
Ailment.create!(description: "pain in my side",
                first_noticed_on: Date.new(2018, 10, 14),
                patient_id: 4)
Ailment.create!(description: "inflamed hand",
                first_noticed_on: Date.new(2018, 6, 2),
                patient_id: 5)
Ailment.create!(description: "either measels or mumps",
                first_noticed_on: Date.new(2018, 7, 11),
                patient_id: 6)
Ailment.create!(description: "chicken pox",
                first_noticed_on: Date.new(2018, 8, 17),
                patient_id: 7)
Ailment.create!(description: "anger management issues",
                first_noticed_on: Date.new(2009, 9, 9),
                patient_id: 1)
Ailment.create!(description: "asthma attacks",
                first_noticed_on: Date.new(1993, 4, 7),
                resolved_status: true,
                patient_id: 1)

User.create!(role: doctor1,
             email: "skrigel@doctor.com",
             password: "doctors",
             password_confirmation: "doctors")
User.create!(role: patient1,
             email: "bburr@patient.com",
             password: "redhead",
             password_confirmation: "redhead")

Appointment.create!(
  scheduled_for: DateTime.strptime("09/14/2018 8:00", "%m/%d/%Y %H:%M"),
  duration_in_minutes: 50,
  doctor_id: 1,
  patient_id: 1,
  ailment_id: 9
)
Appointment.create!(
  scheduled_for: DateTime.strptime("10/14/2018 9:00", "%m/%d/%Y %H:%M"),
  duration_in_minutes: 50,
  doctor_id: 1,
  patient_id: 2,
  ailment_id: 2
)
Appointment.create!(
  scheduled_for: DateTime.strptime("07/01/2018 12:00", "%m/%d/%Y %H:%M"),
  duration_in_minutes: 120,
  doctor_id: 2,
  patient_id: 3,
  ailment_id: 3
)
Appointment.create!(
  scheduled_for: DateTime.strptime("12/25/2018 11:30", "%m/%d/%Y %H:%M"),
  duration_in_minutes: 60,
  doctor_id: 3,
  patient_id: 4,
  ailment_id: 4
)
Appointment.create!(
  scheduled_for: DateTime.strptime("09/22/2018 7:30", "%m/%d/%Y %H:%M"),
  duration_in_minutes: 120,
  doctor_id: 4,
  patient_id: 5,
  ailment_id: 5
)
Appointment.create!(
  scheduled_for: DateTime.strptime("09/23/2018 10:00", "%m/%d/%Y %H:%M"),
  duration_in_minutes: 60,
  doctor_id: 1,
  patient_id: 3,
  ailment_id: 3
)

Prescription.create!(drug: "Steriod Inhaler",
                     dosage_in_milligrams: 15,
                     appointment_id: 1)
Prescription.create!(drug: "Tylenol",
                     dosage_in_milligrams: 60,
                     appointment_id: 5)
Prescription.create!(drug: "Adderall",
                     dosage_in_milligrams: 20,
                     appointment_id: 3)
Prescription.create!(drug: "Antibiotics of some sort",
                     dosage_in_milligrams: 200,
                     appointment_id: 4)
Prescription.create!(drug: "BBQ Ribs",
                     dosage_in_milligrams: 12,
                     appointment_id: 2)
