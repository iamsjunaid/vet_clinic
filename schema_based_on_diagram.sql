-- schema_based_on_diagram.sql
-- create patients table
CREATE TABLE patients (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  date_of_birth DATE
);

-- create medical_histories table
CREATE TABLE medical_histories (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  patient_id INT,
  status VARCHAR(255),
  admitted_at DATE NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

-- create treatments table
CREATE TABLE treatments (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  type VARCHAR(255)
);

-- create invoices table
CREATE TABLE invoices (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES patients(id)
);

-- create invoice_items table
CREATE TABLE invoice_items (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

-- create medical_histories_treatments table to join medical_histories and treatments
CREATE TABLE medical_histories_treatments (
  medical_history_id INT NOT NULL,
  treatment_id INT NOT NULL,
  PRIMARY KEY (medical_history_id, treatment_id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

-- add FK indexes for faster queries
CREATE INDEX idx_medical_histories_patient_id ON medical_histories(id);
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(id);
CREATE INDEX idx_invoices_patient_id ON invoices(id);