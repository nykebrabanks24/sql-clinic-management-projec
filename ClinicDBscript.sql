CREATE DATABASE ClinicDB;
USE ClinicDB;

CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Phone VARCHAR(15)
);

CREATE TABLE Providers (
    ProviderID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100)
);

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    ProviderID INT,
    Date DATE,
    Time TIME,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (ProviderID) REFERENCES Providers(ProviderID)
);

CREATE TABLE Inventory (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100),
    Quantity INT,
    Unit VARCHAR(20)
);

INSERT INTO Patients (FirstName, LastName, DOB, Phone)
VALUES
('Jane', 'Smith', '1985-04-12', '555-1234'),
('Marcus', 'Brown', '1990-06-21', '555-5678');

INSERT INTO Providers (Name, Specialty)
VALUES
('Dr. Lee', 'Dentistry'),
('Dr. Taylor', 'Orthodontics');

INSERT INTO Appointments (PatientID, ProviderID, Date, Time, Status)
VALUES
(1, 1, '2025-06-01', '09:00:00', 'Scheduled'),
(2, 2, '2025-06-01', '10:30:00', 'Scheduled');

INSERT INTO Inventory (ItemName, Quantity, Unit)
VALUES
('Gloves', 5, 'Boxes'),
('Face Masks', 8, 'Boxes');

SELECT 
    p.FirstName, p.LastName, a.Date, a.Time, pr.Name AS Provider
FROM 
    Appointments a
JOIN 
    Patients p ON a.PatientID = p.PatientID
JOIN 
    Providers pr ON a.ProviderID = pr.ProviderID
WHERE 
    a.Status = 'Scheduled';
    
    SELECT ItemName, Quantity
FROM Inventory
WHERE Quantity < 10;