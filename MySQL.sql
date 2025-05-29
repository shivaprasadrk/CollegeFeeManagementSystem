- 1. Create the database
CREATE DATABASE fee_db;

-- 2. Use the database
USE fee_db;

-- 3. Create the FeePayments table
CREATE TABLE FeePayments (
PaymentID INT PRIMARY KEY AUTO_INCREMENT,
StudentID INT,
StudentName VARCHAR(100),
PaymentDate DATE,
Amount DECIMAL(10,2),
Status VARCHAR(20) -- e.g., Paid, Overdue and unpaid.
);
