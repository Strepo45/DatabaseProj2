

--created a databse called 'TechnologyCompany', no other adjustments should be required
--for code to work correctly

--this specific file only relates to DB creation; filtering/selects should be done
--in a separate file.

USE TechnologyCompany

CREATE TABLE offering
(
	offer_id int PRIMARY KEY,
	offering_desc varchar(255)

);

INSERT INTO offering VALUES
	(1, 'Desktop'),
	(2, 'Laptop'),
	(3, 'Phone'),
	(4, 'Screen replacement'),
	(5, 'Desktop upgrade'),
	(6, 'Windows activation')



CREATE TABLE customer
(

	customer_id int PRIMARY KEY,
	customer_name varchar(255),
	dob date,
	age int,
	customer_address varchar(255),
	email varchar(255)

);

INSERT INTO customer VALUES
	(1, 'John Doe', '01/01/2000', 25, '1234 House Street', 'johndoe@outlook.com'),
	(2, 'Jane Doe', '02/02/2002', 23, '0101 Place Drive', 'janedoe@gmail.com'),
	(3, 'Mark Grayson', '04/09/2005', 20, '8723 Burger Lane', 'invincible@gmail.com'),
	(4, 'Bruce Wayne', '10/31/1970', 54, '3008 Batman Place', 'brucewayne@gotham.net')

CREATE TABLE techServices
(
	service_id int PRIMARY KEY,
	unit_responsible varchar(255),
	service_conditions varchar(255),
	offer_id int FOREIGN KEY REFERENCES offering(offer_id)

);

INSERT INTO techServices VALUES
	(1, 'Mobile Services', 'Any phone screen', 4),
	(2, 'Desktop Services', 'Upgradable system', 5),
	(3, 'Desktop Services', 'Actively working system', 6)

CREATE TABLE techProduct
(
	product_id int PRIMARY KEY,
	product_name varchar(255),
	standard_price float,
	first_release_date date,
	offer_id int FOREIGN KEY REFERENCES offering(offer_id)

);

INSERT INTO techProduct VALUES
	(1, 'Desktop', 500.00, '09/05/2023', 1),
	(2, 'Laptop', 250.00, '06/10/2023', 2),
	(3, 'Phone', 125.00, '12/15/2024', 3)


CREATE TABLE maintenance
(
	maintenance_id int PRIMARY KEY,
	hourly_rate float,
	service_id int FOREIGN KEY REFERENCES techServices(service_id)
);

INSERT INTO maintenance VALUES
	(1, 10.00, 1),
	(2, 25.00, 2),
	(3, 20.00, 3)

CREATE TABLE repair
(
	repair_id int PRIMARY KEY, 
	cost float,
	service_id int FOREIGN KEY REFERENCES techServices(service_id),
	product_id int FOREIGN KEY REFERENCES techProduct(product_id)

);

INSERT INTO repair VALUES
	(1, 10.00, 1, 1),
	(2, 25.00, 2, 2),
	(3, 25.00, 3, 3)


CREATE TABLE purchase
(
	purchase_id int PRIMARY KEY,
	customer_id int FOREIGN KEY REFERENCES customer(customer_id),
	offer_id int FOREIGN KEY REFERENCES offering(offer_id),
	purchase_date date,
	contact_person varchar(255)

);

INSERT INTO purchase VALUES
	(1, 1, 1, '03/03/2024', 'John Doe'),
	(2, 2, 1, '05/11/2024', 'Jane Doe'),
	(3, 3, 3, '01/23/2025', 'Mark Grayson'),
	(4, 4, 6, '03/03/2034', 'Bruce Wayne')



CREATE TABLE phone
(
	phone_id int PRIMARY KEY,
	customer_id int FOREIGN KEY REFERENCES customer(customer_id),
	phoneNum varchar(255),
	phone_type varchar(255)

);

INSERT INTO phone VALUES
	(1, 1, '4043031984', 'Apple'),
	(2, 2, '6707231234', 'Android'),
	(3, 3, '1012023003', 'Android'),
	(4, 4, '1234567890', 'Apple'),
	(5, 5, '4707009821', 'Android'),
	(6, 6, '3033232323', 'Apple')

CREATE TABLE bill
(
	bill_id int PRIMARY KEY,
	customer_id int FOREIGN KEY REFERENCES customer(customer_id),
	service_id int FOREIGN KEY REFERENCES techServices(service_id),
	date_of_service date,
	due_date date,
	amount_due float

);

INSERT INTO bill VALUES
	(1, 1, 1, '05/02/2024', '06/02/2024', 10.00),
	(2, 2, 2, '09/21/2023', '10/21/2023' ,25.00),
	(3, 3, 3, '11/01/2024', '12/04/2024', 50.00)
	

Q1. Customer information and their purchases
SELECT
	c.*,
	p.*
FROM
	customer c
JOIN
	purchase p ON c.customer_id = p.customer_id

Q2. List of products under $500
SELECT
	techProduct.product_name,
	techProduct.standard_price
FROM
	techProduct
WHERE
	standard_price < 500
