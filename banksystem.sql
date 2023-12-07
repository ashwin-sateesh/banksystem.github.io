CREATE DATABASE banksystem;
USE banksystem;

-- SQL for creating tables
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY auto_increment,
    name VARCHAR(255)
    -- other customer attributes
);

CREATE TABLE Bank (
    bank_id INT PRIMARY KEY,
    name VARCHAR(255)
    -- other bank attributes
);

CREATE TABLE Account (
    account_id INT PRIMARY KEY auto_increment,
    customer_id INT,
    bank_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(15, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id)
);

CREATE TABLE EmployeeRole (
    role_id INT PRIMARY KEY auto_increment,
    role_name VARCHAR(255)
);


CREATE TABLE Employee (
    employee_id INT PRIMARY KEY auto_increment,
    name VARCHAR(255),
    role_id INT,
    bank_id INT,
    -- other employee attributes
    FOREIGN KEY (role_id) REFERENCES EmployeeRole(role_id),
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id)
    );



CREATE TABLE Card (
    card_id INT PRIMARY KEY auto_increment,
    account_id INT,
    -- other card attributes
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

CREATE TABLE Loan (
    loan_id INT PRIMARY KEY auto_increment,
    customer_id INT,
    account_id INT,
    loan_type VARCHAR(50),
    amount DECIMAL(15, 2),
    -- other loan attributes
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY auto_increment,
    account_id INT,
    amount DECIMAL(15, 2),
    -- other transaction attributes
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);
