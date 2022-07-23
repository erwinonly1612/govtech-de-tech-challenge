--
-- DDL statement to create and load data into the tables for car dealership database
--

BEGIN;

CREATE TABLE Sales_Transaction (
    transaction_id integer NOT NULL,
    datetime_id timestamp,
    serial_number integer,
    customer_id integer,
    salesperson_id integer,
	sales_qty numeric,
	sales_value numeric
);

CREATE TABLE Customer (
    customer_id integer NOT NULL PRIMARY KEY,
    customer_name text,
    customer_phone_number integer
);

CREATE TABLE Salesperson (
    salesperson_id integer NOT NULL PRIMARY KEY,
    salesperson_name text,
    salesperson_phone_number integer
);

CREATE TABLE Car (
    serial_number integer NOT NULL PRIMARY KEY,
    manufacturer_id integer,
    model_name text,
	weight numeric,
	price numeric
);

CREATE TABLE Datetime_Dim (
    datetime_id timestamp NOT NULL PRIMARY KEY,
    transaction_date date,
    year_month character(6)
);

CREATE TABLE Manufacturer (
	manufacturer_id integer NOT NULL PRIMARY KEY,
    manufacturer_name text
);

--
-- Data for Name: Sales_Transaction; Type: TABLE DATA; Schema: public; Owner: erwin
--
INSERT INTO Sales_Transaction (transaction_id, datetime_id, serial_number, customer_id, salesperson_id, sales_qty, sales_value) VALUES (1,'2022-03-17 18:30:10',1,1,1,2,80000);
INSERT INTO Sales_Transaction (transaction_id, datetime_id, serial_number, customer_id, salesperson_id, sales_qty, sales_value) VALUES (2,'2022-03-17 19:45:00',2,2,1,3,150000);
INSERT INTO Sales_Transaction (transaction_id, datetime_id, serial_number, customer_id, salesperson_id, sales_qty, sales_value) VALUES (3,'2022-03-18 20:45:00',2,3,1,2,100000);
INSERT INTO Sales_Transaction (transaction_id, datetime_id, serial_number, customer_id, salesperson_id, sales_qty, sales_value) VALUES (4,'2022-03-19 11:45:00',3,1,2,1,60000);
INSERT INTO Sales_Transaction (transaction_id, datetime_id, serial_number, customer_id, salesperson_id, sales_qty, sales_value) VALUES (5,'2022-03-19 12:45:00',4,2,2,1,45000);
INSERT INTO Sales_Transaction (transaction_id, datetime_id, serial_number, customer_id, salesperson_id, sales_qty, sales_value) VALUES (6,'2022-03-20 12:45:00',5,3,2,1,41000);
INSERT INTO Sales_Transaction (transaction_id, datetime_id, serial_number, customer_id, salesperson_id, sales_qty, sales_value) VALUES (7,'2022-03-20 13:45:00',6,1,2,1,42000);

--
-- Data for Name: Car; Type: TABLE DATA; Schema: public; Owner: erwin
--
INSERT INTO Car (serial_number, manufacturer_id, model_name, weight, price) VALUES (1,1,'BMW 3 Series 330i',323,40000);
INSERT INTO Car (serial_number, manufacturer_id, model_name, weight, price) VALUES (2,1,'BMW 3 Series M340i',400,50000);
INSERT INTO Car (serial_number, manufacturer_id, model_name, weight, price) VALUES (3,2,'Ford F-150 XL',350,60000);
INSERT INTO Car (serial_number, manufacturer_id, model_name, weight, price) VALUES (4,2,'Ford F-150 Raptor',400,45000);
INSERT INTO Car (serial_number, manufacturer_id, model_name, weight, price) VALUES (5,3,'Toyota Prius L Eco',310,41000);
INSERT INTO Car (serial_number, manufacturer_id, model_name, weight, price) VALUES (6,3,'Toyota Prius XLE',329,42000);

--
-- Data for Name: Salesperson; Type: TABLE DATA; Schema: public; Owner: erwin
--
INSERT INTO  Salesperson (salesperson_id, salesperson_name, salesperson_phone_number) VALUES (1,'Brett',97713856);
INSERT INTO  Salesperson (salesperson_id, salesperson_name, salesperson_phone_number) VALUES (2,'Dawn',97315826);

--
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: erwin
--
INSERT INTO Customer (customer_id, customer_name, customer_phone_number) VALUES (1,'John',97702466);
INSERT INTO Customer (customer_id, customer_name, customer_phone_number) VALUES (2,'Adam',98794355);
INSERT INTO Customer (customer_id, customer_name, customer_phone_number) VALUES (3,'Keith',98924415);

--
-- Data for Name: Manufacturer; Type: TABLE DATA; Schema: public; Owner: erwin
--
INSERT INTO Manufacturer (manufacturer_id, manufacturer_name) VALUES (1, 'BMW');
INSERT INTO Manufacturer (manufacturer_id, manufacturer_name) VALUES (2, 'Ford');
INSERT INTO Manufacturer (manufacturer_id, manufacturer_name) VALUES (3, 'Toyota');


--
-- Data for Name: Datetime_Dim; Type: TABLE DATA; Schema: public; Owner: erwin
--
INSERT INTO Datetime_Dim (datetime_id, transaction_date, year_month) VALUES ('2022-03-17 18:30:10','2022-03-17','202203');
INSERT INTO Datetime_Dim (datetime_id, transaction_date, year_month) VALUES ('2022-03-17 19:45:00','2022-03-17','202203');
INSERT INTO Datetime_Dim (datetime_id, transaction_date, year_month) VALUES ('2022-03-18 20:45:00','2022-03-18','202203');
INSERT INTO Datetime_Dim (datetime_id, transaction_date, year_month) VALUES ('2022-03-19 11:45:00','2022-03-19','202203');
INSERT INTO Datetime_Dim (datetime_id, transaction_date, year_month) VALUES ('2022-03-19 12:45:00','2022-03-19','202203');
INSERT INTO Datetime_Dim (datetime_id, transaction_date, year_month) VALUES ('2022-03-20 12:45:00','2022-03-20','202203');
INSERT INTO Datetime_Dim (datetime_id, transaction_date, year_month) VALUES ('2022-03-20 13:45:00','2022-03-20','202203');

COMMIT;