USE car_rental;

-- drop foreign keys
ALTER TABLE booking_line
DROP FOREIGN KEY booking_line_ibfk_1,
DROP FOREIGN KEY booking_line_ibfk_2;

ALTER TABLE car
DROP FOREIGN KEY car_ibfk_1,
DROP FOREIGN KEY car_ibfk_2,
DROP FOREIGN KEY car_ibfk_3;

ALTER TABLE car_spec
DROP FOREIGN KEY car_spec_ibfk_1;

ALTER TABLE card
DROP FOREIGN KEY card_ibfk_1,
DROP FOREIGN KEY card_ibfk_2;

ALTER TABLE card_payment
DROP FOREIGN KEY card_payment_ibfk_1,
DROP FOREIGN KEY card_payment_ibfk_2;

ALTER TABLE customer
DROP FOREIGN KEY customer_payment_ibfk_1,
DROP FOREIGN KEY customer_payment_ibfk_2,
DROP FOREIGN KEY customer_payment_ibfk_3;

ALTER TABLE insurance
DROP FOREIGN KEY insurance_ibfk_1,
DROP FOREIGN KEY insurance_ibfk_2;

ALTER TABLE issue_us
DROP FOREIGN KEY issue_us_ibfk_1,
DROP FOREIGN KEY issue_us_ibfk_2;

ALTER TABLE issue_intl
DROP FOREIGN KEY issue_intl_ibfk_1;

ALTER TABLE location
DROP FOREIGN KEY location_ibfk_1,
DROP FOREIGN KEY location_ibfk_2;

ALTER TABLE rental_price
DROP FOREIGN KEY rental_price_ibfk_1,
DROP FOREIGN KEY rental_price_ibfk_2;

ALTER TABLE office
DROP FOREIGN KEY office_ibfk_1;

ALTER TABLE other_payment
DROP FOREIGN KEY other_payment_ibfk_1;

-- drop tables if exist
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS booking_line;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS car_spec;
DROP TABLE IF EXISTS car_state;
DROP TABLE IF EXISTS car_type;
DROP TABLE IF EXISTS card;
DROP TABLE IF EXISTS card_payment;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_type;
DROP TABLE IF EXISTS insurance;
DROP TABLE IF EXISTS issue_us;
DROP TABLE IF EXISTS issue_intl;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS other_payment;
DROP TABLE IF EXISTS rental_price;
DROP TABLE IF EXISTS state;

-- create tables
CREATE TABLE booking (
	Booking_ID INT NOT NULL,
    Pickup_DateTime DATETIME NOT NULL,
    Return_DateTime DATETIME NOT NULL,
    Payment_Type VARCHAR(10) NOT NULL,
    Booking_Status VARCHAR(10) NOT NULL,
    Total_Charge DOUBLE NOT NULL,
    Return_Office INT NOT NULL,
    PRIMARY KEY (Booking_ID)
);

CREATE TABLE booking_line (
	Booking_ID INT NOT NULL,
    Line_Num INT NOT NULL,
    Car_ID INT NOT NULL,
    Line_Total DOUBLE NOT NULL,
    PRIMARY KEY (Booking_ID, Line_Num)
);

CREATE TABLE car (
	Car_ID INT NOT NULL,
    Spec_ID INT NOT NULL,
    Office_ID INT NOT NULL,
    Rental_Status VARCHAR(10) NOT NULL,
    CarState_ID INT NOT NULL,
    Mileage DOUBLE NOT NULL,
    PRIMARY KEY (Car_ID)
);

CREATE TABLE car_spec (
	Spec_ID INT NOT NULL,
    Brand VARCHAR(20) NOT NULL,
    Color VARCHAR(20) NOT NULL,
    Model VARCHAR(20) NOT NULL,
    Prod_Year INT NOT NULL,
    CarType_ID INT NOT NULL,
    PRIMARY KEY (CarType_ID)
);

CREATE TABLE car_state (
	CarState_ID INT NOT NULL,
    Description VARCHAR(100) NOT NULL,
    PRIMARY KEY (CarState_ID)
);

CREATE TABLE card (
	Card_ID INT NOT NULL,
	Exp_Month INT NOT NULL,
	Exp_Year INT NOT NULL,
	Card_Num INT NOT NULL,
	Billing_StrAdd VARCHAR(100) NOT NULL,
	Cust_ID INT NOT NULL,
	Loc_ID INT NOT NULL,
	PRIMARY KEY (Card_ID)
);

CREATE TABLE card_payment (
	Booking_ID INT NOT NULL,
    Card_ID INT NOT NULL,
    PRIMARY KEY (Booking_ID)
);

CREATE TABLE country (
	Country_ID INT NOT NULL,
    Country_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Country_ID)    
);

CREATE TABLE customer (
	Cust_ID INT NOT NULL,
    Cust_FName VARCHAR(50) NOT NULL,
    Cust_LName VARCHAR(50) NOT NULL,
    Cust_Phone INT NOT NULL,
    Cust_Email VARCHAR(50) NOT NULL,
    Cust_Gender VARCHAR(1) NOT NULL,
    Cust_LicenseNum VARCHAR(20) NOT NULL,
    Cust_IssueLocation VARCHAR(10) NOT NULL,
    Cust_DOB DATE NOT NULL,
    Cust_StrAdd VARCHAR(100) NOT NULL,
    Cust_Username VARCHAR(10) NOT NULL,
    Cust_Password VARCHAR(50) NOT NULL,
    CustType_ID INT NOT NULL,
    Loc_ID INT NOT NULL,
    Ins_ID INT NOT NULL,
    PRIMARY KEY (Cust_ID)
);

CREATE TABLE customer_type (
	CustType_ID INT NOT NULL,
    Description VARCHAR(50) NOT NULL,
    Discount_Rate DOUBLE NOT NULL,
    PRIMARY KEY (CustType_ID)
);

CREATE TABLE insurance (
	Ins_ID INT NOT NULL,
    State_ID INT NOT NULL,
    CarType_ID INT NOT NULL,
    Ins_Rate DOUBLE,
    PRIMARY KEY (Ins_ID)
);

CREATE TABLE issue_us (
	Cust_ID INT NOT NULL,
    State_ID INT NOT NULL,
    PRIMARY KEY (Cust_ID)
);

CREATE TABLE issue_intl (
	Cust_ID INT NOT NULL,
    Country VARCHAR(20) NOT NULL,
    PRIMARY KEY (Cust_ID)
);

CREATE TABLE location (
	Loc_ID INT NOT NULL,
    City VARCHAR(20) NOT NULL,
    State_ID INT NOT NULL,
    Zip INT,
    Country_ID INT NOT NULL,
    PRIMARY KEY (Loc_ID)
);

CREATE TABLE rental_price (
	CarState_ID INT NOT NULL, 
    CarSpec_ID INT NOT NULL, 
    Price DOUBLE NOT NULL,
    PRIMARY KEY(CarState_ID, CarSpec_ID)
);

CREATE TABLE office (
	Office_ID INT NOT NULL,
    Office_StrAdd VARCHAR(100) NOT NULL,
    Office_Phone INT NOT NULL,
    Office_Email VARCHAR(20) NOT NULL,
    Loc_ID INT NOT NULL,
    Office_Username VARCHAR(10) NOT NULL,
    Office_Password VARCHAR(50) NOT NULL,
    PRIMARY KEY (Office_ID)
);

CREATE TABLE other_payment (
	Booking_ID INT NOT NULL,
    Payment_Type VARCHAR(20),
    PRIMARY KEY (Booking_ID)
);

CREATE TABLE state (
	State_ID INT NOT NULL,
    State_Full VARCHAR(20) NOT NULL,
    State_Abbr VARCHAR(10) NOT NULL,
    PRIMARY KEY (State_ID)
);

-- create foreign keys
ALTER TABLE booking_line
ADD FOREIGN KEY (Booking_ID) REFERENCES booking (Booking_ID),
ADD FOREIGN KEY (Car_ID) REFERENCES car (Car_ID);

ALTER TABLE car
ADD FOREIGN KEY (Spec_ID) REFERENCES car_spec (Spec_ID),
ADD FOREIGN KEY (Office_ID) REFERENCES office (Office_ID),
ADD FOREIGN KEY (CarState_ID) REFERENCES car_state (CarState_ID);

ALTER TABLE car_spec
ADD FOREIGN KEY (CarType_ID) REFERENCES car_type (CarType_ID);

ALTER TABLE card
ADD FOREIGN KEY (Cust_ID) REFERENCES customer (Cust_ID),
ADD FOREIGN KEY (Loc_ID) REFERENCES location (Loc_ID);

ALTER TABLE card_payment
ADD FOREIGN KEY (Booking_ID) REFERENCES booking (Booking_ID),
ADD FOREIGN KEY (Card_ID) REFERENCES card (Card_ID);

ALTER TABLE customer
ADD FOREIGN KEY (CustType_ID) REFERENCES customer_type (CustType_ID),
ADD FOREIGN KEY (Loc_ID) REFERENCES location (Loc_ID),
ADD FOREIGN KEY (Ins_ID) REFERENCES insurance (Ins_ID);

ALTER TABLE insurance
ADD FOREIGN KEY (State_ID) REFERENCES state (State_ID),
ADD FOREIGN KEY (CarType_ID) REFERENCES car_type (CarType_ID);

ALTER TABLE issue_us
ADD FOREIGN KEY (Cust_ID) REFERENCES customer (Cust_ID),
ADD FOREIGN KEY (State_ID) REFERENCES state (State_ID);

ALTER TABLE issue_intl
ADD FOREIGN KEY (Cust_ID) REFERENCES customer (Cust_ID);

ALTER TABLE location
ADD FOREIGN KEY (State_ID) REFERENCES state (State_ID),
ADD FOREIGN KEY (Country_ID) REFERENCES country (Country_ID);

ALTER TABLE rental_price
ADD FOREIGN KEY (CarState_ID) REFERENCES car_state (CarState_ID),
ADD FOREIGN KEY (CarSpec_ID) REFERENCES car_spec (CarSpec_ID);

ALTER TABLE office
ADD FOREIGN KEY (Loc_ID) REFERENCES location (Loc_ID);

ALTER TABLE other_payment
ADD FOREIGN KEY (Booking_ID) REFERENCES booking (Booking_ID);

