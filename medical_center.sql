DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    status TEXT, -- 'resident', 'attending', or 'unavailable'
    salary FLOAT CHECK (salary >= 0) NOT NULL,
);

CREATE TABLE specializations
(
    id SERIAL PRIMARY KEY,
    specialization TEXT NOT NULL
);

CREATE TABLE doctors_specializations
(
    id SERIAL PRIMARY KEY,
    doctorid INT NOT NULL REFERENCES doctors ON DELETE CASCADE,
    specializationid INT NOT NULL REFERENCES specializations ON DELETE CASCADE
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    diagnosis TEXT,
    status TEXT, -- 'unwell', 'recovered', 'remission', 'deceased'
);

CREATE TABLE doctors_patients
(
    id SERIAL PRIMARY KEY,
    doctorid INT NOT NULL REFERENCES doctors ON DELETE CASCADE,
    patientid INT NOT NULL REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE languages
(
    id SERIAL PRIMARY KEY,
    language TEXT NOT NULL
);

CREATE TABLE doctors_languages
(
    id SERIAL PRIMARY KEY,
    doctorid INT NOT NULL REFERENCES doctors ON DELETE CASCADE
);

CREATE TABLE patients_languages
(
    id SERIAL PRIMARY KEY,
    patientid INT NOT NULL REFERENCES patients ON DELETE CASCADE
);
