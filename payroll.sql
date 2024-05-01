-- Create the database
CREATE DATABASE payroll;
USE payroll;

-- Create the employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample data into the employees table
INSERT INTO employees (first_name, last_name, email, phone, hire_date, job_title, department_id, salary)
VALUES
    ('John', 'Doe', 'john.doe@company.com', '555-1234', '2020-01-01', 'Software Engineer', 1, 80000.00),
    ('Jane', 'Smith', 'jane.smith@company.com', '555-5678', '2019-03-15', 'Marketing Manager', 2, 90000.00),
    ('Michael', 'Johnson', 'michael.johnson@company.com', '555-9012', '2021-07-01', 'Accountant', 3, 75000.00),
    ('Emily', 'Brown', 'emily.brown@company.com', '555-3456', '2022-05-10', 'Human Resources Specialist', 4, 65000.00),
    ('David', 'Wilson', 'david.wilson@company.com', '555-7890', '2018-11-01', 'Sales Representative', 5, 70000.00),
    ('Sarah', 'Taylor', 'sarah.taylor@company.com', '555-2345', '2020-03-01', 'Project Manager', 1, 85000.00),
    ('Robert', 'Anderson', 'robert.anderson@company.com', '555-6789', '2019-09-15', 'Web Developer', 1, 75000.00),
    ('Jessica', 'Thomas', 'jessica.thomas@company.com', '555-0123', '2021-02-01', 'Graphic Designer', 6, 60000.00),
    ('Daniel', 'Moore', 'daniel.moore@company.com', '555-4567', '2022-08-01', 'Data Analyst', 7, 70000.00),
    ('Ashley', 'Martinez', 'ashley.martinez@company.com', '555-8901', '2020-06-15', 'Customer Service Representative', 8, 50000.00),
    ('Matthew', 'Jackson', 'matthew.jackson@company.com', '555-2345', '2019-01-01', 'Operations Manager', 9, 90000.00),
    ('Olivia', 'White', 'olivia.white@company.com', '555-6789', '2021-10-01', 'Content Writer', 6, 55000.00),
    ('Andrew', 'Harris', 'andrew.harris@company.com', '555-0123', '2022-03-01', 'Financial Analyst', 3, 80000.00),
    ('Sophia', 'Martin', 'sophia.martin@company.com', '555-4567', '2020-09-15', 'Administrative Assistant', 10, 45000.00),
    ('William', 'Thompson', 'william.thompson@company.com', '555-8901', '2019-05-01', 'Quality Assurance Tester', 1, 65000.00),
    ('Emma', 'Garcia', 'emma.garcia@company.com', '555-2345', '2021-12-01', 'User Experience Designer', 6, 70000.00),
    ('Jacob', 'Martinez', 'jacob.martinez@company.com', '555-6789', '2022-06-01', 'Network Administrator', 1, 75000.00),
    ('Isabella', 'Robinson', 'isabella.robinson@company.com', '555-0123', '2020-02-15', 'Marketing Coordinator', 2, 55000.00),
    ('Michael', 'Clark', 'michael.clark@company.com', '555-4567', '2019-11-01', 'Logistics Specialist', 5, 60000.00),
    ('Mia', 'Rodriguez', 'mia.rodriguez@company.com', '555-8901', '2021-04-01', 'Human Resources Assistant', 4, 50000.00);

-- Create the departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Insert sample data into the departments table
INSERT INTO departments (department_name, location)
VALUES
    ('IT', 'New York'),
    ('Marketing', 'Los Angeles'),
    ('Accounting', 'Chicago'),
    ('Human Resources', 'San Francisco'),
    ('Sales', 'Miami'),
    ('Creative', 'Seattle'),
    ('Data Analytics', 'Boston'),
    ('Customer Service', 'Dallas'),
    ('Operations', 'Houston'),
    ('Administration', 'Philadelphia'),
    ('Research and Development', 'Atlanta'),
    ('Finance', 'Denver'),
    ('Logistics', 'Phoenix'),
    ('Legal', 'Washington D.C.'),
    ('Training', 'Austin'),
    ('Quality Assurance', 'Portland'),
    ('Procurement', 'San Diego'),
    ('Facilities', 'Tampa'),
    ('Security', 'Nashville'),
    ('Public Relations', 'Baltimore');

-- Create the payroll_records table
CREATE TABLE payroll_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    pay_period_start DATE NOT NULL,
    pay_period_end DATE NOT NULL,
    hours_worked DECIMAL(5, 2) NOT NULL,
    gross_pay DECIMAL(10, 2) NOT NULL,
    taxes DECIMAL(10, 2) NOT NULL,
    deductions DECIMAL(10, 2) NOT NULL,
    net_pay DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data into the payroll_records table
INSERT INTO payroll_records (employee_id, pay_period_start, pay_period_end, hours_worked, gross_pay, taxes, deductions, net_pay)
VALUES
    (1, '2023-01-01', '2023-01-15', 80.00, 2000.00, 300.00, 100.00, 1600.00),
    (2, '2023-01-01', '2023-01-15', 80.00, 2250.00, 337.50, 125.00, 1787.50),
    (3, '2023-01-01', '2023-01-15', 80.00, 1875.00, 281.25, 75.00, 1518.75),
    (4, '2023-01-01', '2023-01-15', 80.00, 1625.00, 243.75, 50.00, 1331.25),
    (5, '2023-01-01', '2023-01-15', 80.00, 1750.00, 262.50, 100.00, 1387.50),
    (6, '2023-01-01', '2023-01-15', 80.00, 2125.00, 318.75, 125.00, 1681.25),
    (7, '2023-01-01', '2023-01-15', 80.00, 1875.00, 281.25, 100.00, 1493.75),
    (8, '2023-01-01', '2023-01-15', 80.00, 1500.00, 225.00, 75.00, 1200.00),
    (9, '2023-01-01', '2023-01-15', 80.00, 1750.00, 262.50, 100.00, 1387.50),
    (10, '2023-01-01', '2023-01-15', 80.00, 1250.00, 187.50, 50.00, 1012.50),
    (11, '2023-01-01', '2023-01-15', 80.00, 2250.00, 337.50, 125.00, 1787.50),
    (12, '2023-01-01', '2023-01-15', 80.00, 1375.00, 206.25, 75.00, 1093.75),
    (13, '2023-01-01', '2023-01-15', 80.00, 2000.00, 300.00, 100.00, 1600.00),
    (14, '2023-01-01', '2023-01-15', 80.00, 1125.00, 168.75, 50.00, 906.25),
    (15, '2023-01-01', '2023-01-15', 80.00, 1625.00, 243.75, 75.00, 1306.25),
    (16, '2023-01-01', '2023-01-15', 80.00, 1750.00, 262.50, 100.00, 1387.50),
    (17, '2023-01-01', '2023-01-15', 80.00, 1875.00, 281.25, 125.00, 1468.75),
    (18, '2023-01-01', '2023-01-15', 80.00, 1375.00, 206.25, 50.00, 1118.75),
    (19, '2023-01-01', '2023-01-15', 80.00, 1500.00, 225.00, 75.00, 1200.00),
    (20, '2023-01-01', '2023-01-15', 80.00, 1250.00, 187.50, 50.00, 1012.50);

-- Create the time_records table
CREATE TABLE time_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    date DATE NOT NULL,
    clock_in TIME NOT NULL,
    clock_out TIME NOT NULL,
    hours_worked DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data into the time_records table
INSERT INTO time_records (employee_id, date, clock_in, clock_out, hours_worked)
VALUES
    (1, '2023-04-01', '09:00:00', '17:00:00', 8.00),
    (2, '2023-04-01', '08:30:00', '17:30:00', 9.00),
    (3, '2023-04-01', '10:00:00', '18:00:00', 8.00),
    (4, '2023-04-01', '09:30:00', '17:30:00', 8.00),
    (5, '2023-04-01', '08:00:00', '16:00:00', 8.00),
    (6, '2023-04-01', '09:00:00', '18:00:00', 9.00),
    (7, '2023-04-01', '10:00:00', '19:00:00', 9.00),
    (8, '2023-04-01', '08:30:00', '16:30:00', 8.00),
    (9, '2023-04-01', '09:00:00', '17:00:00', 8.00),
    (10, '2023-04-01', '10:00:00', '18:00:00', 8.00),
    (11, '2023-04-01', '08:00:00', '17:00:00', 9.00),
    (12, '2023-04-01', '09:30:00', '18:30:00', 9.00),
    (13, '2023-04-01', '10:00:00', '19:00:00', 9.00),
    (14, '2023-04-01', '08:30:00', '16:30:00', 8.00),
    (15, '2023-04-01', '09:00:00', '17:00:00', 8.00),
    (16, '2023-04-01', '10:00:00', '18:00:00', 8.00),
    (17, '2023-04-01', '08:00:00', '17:00:00', 9.00),
    (18, '2023-04-01', '09:30:00', '18:30:00', 9.00),
    (19, '2023-04-01', '10:00:00', '19:00:00', 9.00),
    (20, '2023-04-01', '08:30:00', '16:30:00', 8.00);

-- Create the leave_records table
CREATE TABLE leave_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    leave_type VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    reason TEXT,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data into the leave_records table
INSERT INTO leave_records (employee_id, leave_type, start_date, end_date, reason, status)
VALUES
    (1, 'Sick Leave', '2023-04-15', '2023-04-17', 'Flu', 'Approved'),
    (2, 'Vacation', '2023-06-01', '2023-06-15', 'Summer Vacation', 'Pending'),
    (3, 'Maternity Leave', '2023-08-01', '2023-10-31', NULL, 'Approved'),
    (4, 'Bereavement Leave', '2023-05-10', '2023-05-12', 'Family Emergency', 'Approved'),
    (5, 'Personal Leave', '2023-07-01', '2023-07-03', 'Moving', 'Pending'),
    (6, 'Sick Leave', '2023-03-20', '2023-03-22', 'Migraine', 'Approved'),
    (7, 'Vacation', '2023-09-01', '2023-09-15', 'Travel', 'Pending'),
    (8, 'Paternity Leave', '2023-11-01', '2023-11-30', NULL, 'Approved'),
    (9, 'Sick Leave', '2023-04-05', '2023-04-07', 'Cold', 'Approved'),
    (10, 'Vacation', '2023-07-15', '2023-07-22', 'Family Vacation', 'Pending'),
    (11, 'Personal Leave', '2023-06-01', '2023-06-03', 'Moving', 'Approved'),
    (12, 'Sick Leave', '2023-03-10', '2023-03-12', 'Stomach Flu', 'Approved'),
    (13, 'Vacation', '2023-08-15', '2023-08-31', 'Travel', 'Pending'),
    (14, 'Maternity Leave', '2023-10-01', '2023-12-31', NULL, 'Approved'),
    (15, 'Bereavement Leave', '2023-04-20', '2023-04-22', 'Family Emergency', 'Approved'),
    (16, 'Sick Leave', '2023-05-01', '2023-05-03','Fever', 'Approved'),
    (17, 'Vacation', '2023-07-01', '2023-07-15', 'Summer Vacation', 'Pending'),
    (18, 'Personal Leave', '2023-06-15', '2023-06-17', 'Moving', 'Approved'),
    (19, 'Sick Leave', '2023-03-25', '2023-03-27', 'Flu', 'Approved'),
    (20, 'Vacation', '2023-09-01', '2023-09-15', 'Travel', 'Pending');

-- Create the benefits table
CREATE TABLE benefits (
    benefit_id INT AUTO_INCREMENT PRIMARY KEY,
    benefit_name VARCHAR(100) NOT NULL,
    benefit_description TEXT,
    eligibility_criteria TEXT
);

-- Insert sample data into the benefits table
INSERT INTO benefits (benefit_name, benefit_description, eligibility_criteria)
VALUES
    ('Health Insurance', 'Comprehensive medical coverage for employees and their dependents', 'Full-time employees after 90 days of employment'),
    ('Dental Insurance', 'Dental coverage for preventive and basic dental services', 'Full-time employees after 90 days of employment'),
    ('Vision Insurance', 'Coverage for routine eye exams and vision correction', 'Full-time employees after 90 days of employment'),
    ('Life Insurance', 'Term life insurance policy for employees', 'Full-time employees after 90 days of employment'),
    ('Disability Insurance', 'Income protection in case of short-term or long-term disability', 'Full-time employees after 90 days of employment'),
    ('Retirement Plan', '401(k) retirement savings plan with employer matching', 'Full-time employees after 1 year of employment'),
    ('Paid Time Off', 'Paid vacation, sick leave, and personal days', 'All employees after 90 days of employment'),
    ('Tuition Reimbursement', 'Reimbursement for job-related courses and certifications', 'Full-time employees after 1 year of employment'),
    ('Employee Assistance Program', 'Confidential counseling and support services', 'All employees and their dependents'),
    ('Gym Membership Discount', 'Discounted rates at partner gym facilities', 'All employees');

-- Create the employee_benefits table
CREATE TABLE employee_benefits (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    benefit_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (benefit_id) REFERENCES benefits(benefit_id)
);

-- Insert sample data into the employee_benefits table
INSERT INTO employee_benefits (employee_id, benefit_id, enrollment_date)
VALUES
    (1, 1, '2020-04-01'),
    (1, 2, '2020-04-01'),
    (1, 3, '2020-04-01'),
    (1, 4, '2020-04-01'),
    (1, 5, '2020-04-01'),
    (1, 6, '2021-01-01'),
    (1, 7, '2020-04-01'),
    (2, 1, '2019-06-15'),
    (2, 2, '2019-06-15'),
    (2, 3, '2019-06-15'),
    (2, 4, '2019-06-15'),
    (2, 5, '2019-06-15'),
    (2, 6, '2020-03-15'),
    (2, 7, '2019-06-15'),
    (3, 1, '2021-10-01'),
    (3, 2, '2021-10-01'),
    (3, 3, '2021-10-01'),
    (3, 4, '2021-10-01'),
    (3, 5, '2021-10-01'),
    (3, 7, '2021-10-01');

-- Create the payroll_taxes table
CREATE TABLE payroll_taxes (
    tax_id INT AUTO_INCREMENT PRIMARY KEY,
    tax_name VARCHAR(100) NOT NULL,
    tax_rate DECIMAL(5, 4) NOT NULL,
    tax_description TEXT
);

INSERT INTO payroll_taxes (tax_name, tax_rate, tax_description)
VALUES
    ('Federal Income Tax', 0.2200, 'Federal income tax withheld from employee paychecks'),
    ('State Income Tax', 0.0500, 'State income tax withheld from employee paychecks'),
    ('Social Security Tax', 0.0620, 'Social Security tax contribution'),
    ('Medicare Tax', 0.0145, 'Medicare tax contribution'),
    ('Unemployment Tax', 0.0030, 'Unemployment tax contribution'),
    ('Disability Tax', 0.0050, 'Disability tax contribution'),
    ('Local Income Tax', 0.0300, 'Local income tax withheld from employee paychecks'),
    ('Additional Medicare Tax', 0.0090, 'Additional Medicare tax for high-income earners'),
    ('Family Leave Tax', 0.0010, 'Tax contribution for family leave benefits'),
    ('Worker''s Compensation Tax', 0.0075, 'Tax contribution for worker''s compensation insurance');
-- Create the deductions table
CREATE TABLE deductions (
    deduction_id INT AUTO_INCREMENT PRIMARY KEY,
    deduction_name VARCHAR(100) NOT NULL,
    deduction_description TEXT,
    deduction_type VARCHAR(50) NOT NULL
);

-- Insert sample data into the deductions table
INSERT INTO deductions (deduction_name, deduction_description, deduction_type)
VALUES
    ('Health Insurance Premium', 'Employee contribution for health insurance coverage', 'Pre-Tax'),
    ('Dental Insurance Premium', 'Employee contribution for dental insurance coverage', 'Pre-Tax'),
    ('Vision Insurance Premium', 'Employee contribution for vision insurance coverage', 'Pre-Tax'),
    ('Life Insurance Premium', 'Employee contribution for life insurance coverage', 'Post-Tax'),
    ('Disability Insurance Premium', 'Employee contribution for disability insurance coverage', 'Pre-Tax'),
    ('Retirement Contribution', 'Employee contribution to 401(k) retirement plan', 'Pre-Tax'),
    ('Parking Fee', 'Fee for employee parking', 'Post-Tax'),
    ('Union Dues', 'Dues paid to labor union', 'Post-Tax'),
    ('Charitable Contributions', 'Employee charitable contributions', 'Post-Tax'),
    ('Loan Repayment', 'Repayment of employee loans or advances', 'Post-Tax');

-- Create the employee_deductions table
CREATE TABLE employee_deductions (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    deduction_id INT NOT NULL,
    deduction_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (deduction_id) REFERENCES deductions(deduction_id)
);

-- Insert sample data into the employee_deductions table
INSERT INTO employee_deductions (employee_id, deduction_id, deduction_amount)
VALUES
    (1, 1, 100.00),
    (1, 2, 50.00),
    (1, 3, 25.00),
    (2, 1, 120.00),
    (2, 2, 60.00),
    (2, 3, 30.00),
    (3, 1, 80.00),
    (3, 2, 40.00),
    (4, 1, 90.00),
    (4, 2, 45.00),
    (4, 3, 20.00),
    (5, 1, 100.00),
    (5, 2, 50.00),
    (6, 1, 110.00),
    (6, 2, 55.00),
    (6, 3, 25.00),
    (7, 1, 80.00),
    (7, 2, 40.00),
    (8, 1, 70.00),
    (8, 2, 35.00),
    (8, 3, 15.00),
    (9, 1, 90.00),
    (9, 2, 45.00),
    (10, 1, 60.00),
    (10, 2, 30.00),
    (10, 3, 10.00),
    (11, 1, 120.00),
    (11, 2, 60.00),
    (11, 3, 30.00),
    (12, 1, 80.00),
    (12, 2, 40.00),
    (13, 1, 100.00),
    (13, 2, 50.00),
    (13, 3, 25.00),
    (14, 1, 70.00),
    (14, 2, 35.00),
    (15, 1, 90.00),
    (15, 2, 45.00),
    (15, 3, 20.00),
    (16, 1, 100.00),
    (16, 2, 50.00),
    (16, 3, 25.00),
    (17, 1, 90.00),
    (17, 2, 45.00),
    (18, 1, 80.00),
    (18, 2, 40.00),
    (19, 1, 70.00),
    (19, 2, 35.00),
    (19, 3, 15.00),
    (20, 1, 60.00),
    (20, 2, 30.00),
    (20, 3, 10.00);
    
-- Show records from the employees table
SELECT * FROM employees;

-- Show records from the departments table
SELECT * FROM departments;

-- Show records from the payroll_records table
SELECT * FROM payroll_records;

-- Show records from the time_records table
SELECT * FROM time_records;

-- Show records from the leave_records table
SELECT * FROM leave_records;

-- Show records from the benefits table
SELECT * FROM benefits;

-- Show records from the employee_benefits table
SELECT * FROM employee_benefits;

-- Show records from the payroll_taxes table
SELECT * FROM payroll_taxes;

-- Show records from the deductions table
SELECT * FROM deductions;

-- Show records from the employee_deductions table
SELECT * FROM employee_deductions;