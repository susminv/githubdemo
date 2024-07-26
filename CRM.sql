-------------CRM project---------------------

CREATE DATABASE CRM;
USE CRM;

----USER TABLE
CREATE TABLE users(
	userid INT PRIMARY KEY IDENTITY,
	username VARCHAR(25) NOT NULL,
	firstname VARCHAR(25) NOT NULL,
	lastname VARCHAR(25) NOT NULL,
	pwd NVARCHAR(20) NOT NULL,
);

----COURSE TABLE
CREATE TABLE courses(
	coursecode INT IDENTITY PRIMARY KEY,
	cname VARCHAR(50) NOT NULL,
	descr VARCHAR(100) NOT NULL,
	duration_in_hours INT NOT NULL,
	fees INT NOT NULL
);

----QUALIFICATION
CREATE TABLE qualifications(
	qualificationid INT PRIMARY KEY NOT NULL,
	qname VARCHAR(50) NOT NULL,
	coursecode INT NOT NULL,
	CONSTRAINT fk1 FOREIGN KEY(coursecode)
	REFERENCES courses(coursecode)
	);


---- Course modules
CREATE TABLE modules(
	moduleid INT PRIMARY KEY NOT NULL,
	modulename VARCHAR(50) NOT NULL,
	coursecode INT NOT NULL,
	CONSTRAINT fk2 FOREIGN KEY(coursecode)
	REFERENCES courses(coursecode)
	);


---- Enquiry table
CREATE TABLE enquiry(
	enqcode INT PRIMARY KEY IDENTITY,
	courseid INT NOT NULL,
	enquirerid INT NOT NULL,
	enquirydate DATE DEFAULT(GETDATE()),
	enquirystatus INT NOT NULL,
	CONSTRAINT fk3 FOREIGN KEY(enquirystatus)
	REFERENCES enstatus(statid)
	);

---- Enquiry status table
CREATE TABLE enstatus(
	statid INT PRIMARY KEY,
	statname VARCHAR(50)
	);

---- Enquirer table
CREATE TABLE enquirer(
	enquirerid INT IDENTITY PRIMARY KEY,
	enqcode INT,
	name VARCHAR(50),
	dob DATE,
	email VARCHAR(50), 
	mobile_number INT,
	enaddress VARCHAR(75), 
	Hqual INT, 
	markspercent INT, 
	YearofPassout INT CHECK(YearofPassout<2024),
	Resourceid INT,
	CONSTRAINT fk4 FOREIGN KEY(enqcode)
	REFERENCES enquiry(enqcode),
	CONSTRAINT fk5 FOREIGN KEY(Hqual)
	REFERENCES qualifications(qualificationid),
	CONSTRAINT fk6 FOREIGN KEY(Resourceid)
	REFERENCES resources(Resourceid)
	);
----Resources
CREATE TABLE resources(
	resourceid INT IDENTITY PRIMARY KEY,
	resourcename VARCHAR(50)
	);
