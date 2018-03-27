USE car_rental;

-- drop foreign keys
ALTER TABLE booking
DROP FOREIGN KEY booking_ibfk_1;

ALTER TABLE booking_line
DROP FOREIGN KEY booking_line_ibfk_1,
DROP FOREIGN KEY booking_line_ibfk_2;

ALTER TABLE car
DROP FOREIGN KEY car_ibfk_1,
DROP FOREIGN KEY car_ibfk_2,
DROP FOREIGN KEY car_ibfk_3;

ALTER TABLE car_spec
DROP FOREIGN KEY car_spec_ibfk_1,
DROP FOREIGN KEY car_spec_ibfk_2;

ALTER TABLE card
DROP FOREIGN KEY card_ibfk_1;

ALTER TABLE card_payment
DROP FOREIGN KEY card_payment_ibfk_1,
DROP FOREIGN KEY card_payment_ibfk_2;

ALTER TABLE customer
DROP FOREIGN KEY customer_payment_ibfk_1;

ALTER TABLE rental_price
DROP FOREIGN KEY rental_price_ibfk_1,
DROP FOREIGN KEY rental_price_ibfk_2;

-- drop tables if exist
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS booking_line;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS car_make;
DROP TABLE IF EXISTS car_spec;
DROP TABLE IF EXISTS car_state;
DROP TABLE IF EXISTS car_type;
DROP TABLE IF EXISTS card;
DROP TABLE IF EXISTS card_payment;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_type;
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS rental_price;

-- create tables
CREATE TABLE booking (
	Booking_ID INT NOT NULL,
    Pickup_DateTime DATETIME NOT NULL,
    Return_DateTime DATETIME NOT NULL,
    Payment_Type VARCHAR(10) NOT NULL,
    Booking_Status VARCHAR(10) NOT NULL,
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
    CarState_ID INT NOT NULL,
    Mileage DOUBLE,
    PRIMARY KEY (Car_ID)
);

CREATE TABLE car_make (
	CarMake_ID INT NOT NULL,
    Description VARCHAR(100) NOT NULL,
    PRIMARY KEY (CarMake_ID)
);

CREATE TABLE car_spec (
	Spec_ID INT NOT NULL,
    CarMake_ID VARCHAR(20) NOT NULL,
    Model VARCHAR(20) NOT NULL,
    Prod_Year INT NOT NULL,
    CarType_ID INT NOT NULL,
    Image_URL VARCHAR(200),
    Seats INT,
    Cruise_Control VARCHAR(10),
    Air_Conditioning VARCHAR(10),
    Parking_Sensor VARCHAR(10),
    Heated_Seats VARCHAR(10),
    Audio_Input VARCHAR(10),
    Bluetooth VARCHAR(10),
    Sunroof VARCHAR(10),
    Price_Bought DOUBLE,
    PRIMARY KEY (Spec_ID)
);

CREATE TABLE car_state (
	CarState_ID INT NOT NULL,
    Description VARCHAR(100) NOT NULL,
    PRIMARY KEY (CarState_ID)
);

CREATE TABLE car_type (
	CarType_ID INT NOT NULL,
    Description VARCHAR(100) NOT NULL,
    PRIMARY KEY (CarType_ID)
);

CREATE TABLE card (
	Card_ID INT NOT NULL,
	Exp_Month INT NOT NULL,
	Exp_Year INT NOT NULL,
	Card_Num INT NOT NULL,
	Cust_ID INT NOT NULL,
	PRIMARY KEY (Card_ID)
);

CREATE TABLE card_payment (
	Booking_ID INT NOT NULL,
    Card_ID INT NOT NULL,
    PRIMARY KEY (Booking_ID)
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
    Cust_City VARCHAR(50),
    Cust_State VARCHAR(50),
    Cust_Zip INT,
    Cust_Username VARCHAR(10) NOT NULL,
    Cust_Password VARCHAR(50) NOT NULL,
    CustType_ID INT NOT NULL,
    PRIMARY KEY (Cust_ID)
);

CREATE TABLE customer_type (
	CustType_ID INT NOT NULL,
    Description VARCHAR(50) NOT NULL,
    Multiplier DOUBLE NOT NULL,
    PRIMARY KEY (CustType_ID)
);

CREATE TABLE office (
	Office_ID INT NOT NULL,
    Office_StrAdd VARCHAR(100) NOT NULL,
    Office_City VARCHAR(50),
    Office_State VARCHAR(50),
    Office_Zip INT,
    Office_Phone INT NOT NULL,
    Office_Username VARCHAR(10) NOT NULL,
    Office_Password VARCHAR(50) NOT NULL,
    PRIMARY KEY (Office_ID)
);

CREATE TABLE rental_price (
	CarState_ID INT NOT NULL, 
    Spec_ID INT NOT NULL, 
    Price DOUBLE NOT NULL,
    PRIMARY KEY(CarState_ID, Spec_ID)
);

-- create foreign keys
ALTER TABLE booking
ADD FOREIGN KEY (Return_Office) REFERENCES office (Office_ID);

ALTER TABLE booking_line
ADD FOREIGN KEY (Booking_ID) REFERENCES booking (Booking_ID),
ADD FOREIGN KEY (Car_ID) REFERENCES car (Car_ID);

ALTER TABLE car
ADD FOREIGN KEY (Spec_ID) REFERENCES car_spec (Spec_ID),
ADD FOREIGN KEY (Office_ID) REFERENCES office (Office_ID),
ADD FOREIGN KEY (CarState_ID) REFERENCES car_state (CarState_ID);

ALTER TABLE car_spec
ADD FOREIGN KEY (CarType_ID) REFERENCES car_type (CarType_ID),
ADD FOREIGN KEY (CarMake_ID) REFERENCES car_make (CarMake_ID);

ALTER TABLE card
ADD FOREIGN KEY (Cust_ID) REFERENCES customer (Cust_ID);

ALTER TABLE card_payment
ADD FOREIGN KEY (Booking_ID) REFERENCES booking (Booking_ID),
ADD FOREIGN KEY (Card_ID) REFERENCES card (Card_ID);

ALTER TABLE customer
ADD FOREIGN KEY (CustType_ID) REFERENCES customer_type (CustType_ID);

ALTER TABLE rental_price
ADD FOREIGN KEY (CarState_ID) REFERENCES car_state (CarState_ID),
ADD FOREIGN KEY (Spec_ID) REFERENCES car_spec (Spec_ID);