
--created a database called 'TechnologyCompany', no other adjustments should be required
--for code to work correctly

--this specific file only relates to DB creation; filtering/selects should be done
--in a separate file.

USE TechnologyCompany

CREATE TABLE offering
(
	offer_id int PRIMARY KEY,
	offering_desc varchar(255)

);

CREATE TABLE customer
(

	customer_id int PRIMARY KEY,
	customer_name varchar(255),
	dob date,
	age int,
	customer_address varchar(255),
	email varchar(255)

);

CREATE TABLE techServices
(
	service_id int PRIMARY KEY,
	unit_responsible varchar(255),
	service_conditions varchar(255),
	offer_id int FOREIGN KEY REFERENCES offering(offer_id)

);

CREATE TABLE techProduct
(
	product_id int PRIMARY KEY,
	product_name varchar(255),
	standard_price float,
	first_release_date date,
	offer_id int FOREIGN KEY REFERENCES offering(offer_id)

);


CREATE TABLE maintenance
(
	maintenance_id int PRIMARY KEY,
	hourly_rate float,
	service_id int FOREIGN KEY REFERENCES techServices(service_id)
);

CREATE TABLE repair
(
	repair_id int PRIMARY KEY, 
	cost float,
	service_id int FOREIGN KEY REFERENCES techServices(service_id),
	product_id int FOREIGN KEY REFERENCES techProduct(product_id)

);



CREATE TABLE purchase
(
	purchase_id int PRIMARY KEY,
	customer_id int FOREIGN KEY REFERENCES customer(customer_id),
	offer_id int FOREIGN KEY REFERENCES offering(offer_id),
	purchase_date date,
	contact_person varchar(255)

);



CREATE TABLE phone
(
	phone_id int PRIMARY KEY,
	customer_id int FOREIGN KEY REFERENCES customer(customer_id),
	phoneNum varchar(255),
	phone_type varchar(255)

);

CREATE TABLE bill
(
	bill_id int PRIMARY KEY,
	customer_id int FOREIGN KEY REFERENCES customer(customer_id),
	service_id int FOREIGN KEY REFERENCES techServices(service_id),
	date_of_service date,
	due_date date,
	amount_due float

);

