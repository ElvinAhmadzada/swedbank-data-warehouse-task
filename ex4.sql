Create the data model for a restaurant chain database according to the following information:

Organization has restaurant chain (of which you want to store address, city, country, restaurant name and branch phone numbers (operator, kitchen, accounting). Each restaurant has seating tables with different seat count and types. Chain has flagship restaurant. 
Restaurant clients are registered in restaurant database by operators while caller is making reservation. Information about operator contains name, surname, person identification number, personal phone number, branch where he is sitting (physically working) and restaurant for which he is making reservations. Client data could contain information about client name, surname, phone number and operator comment (discounts, allergens, etc.). Reservation can be made by everyone who call to restaurant operator (do not need store information about calls). While operator is creating reservation, he is asking name, phone number, restaurant name (address), seating information, date, time and offers caller became as client. Operator can add comment about reservation. 


CREATE TABLE Restaurant (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Flagship BOOLEAN
);

CREATE TABLE Restaurant_Location (
  ID SERIAL PRIMARY KEY,
  Restaurant_ID INTEGER NOT NULL REFERENCES Restaurant(ID),
  Address VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  Country VARCHAR(255) NOT NULL
);

CREATE TABLE Restaurant_Phone (
  ID SERIAL PRIMARY KEY,
  Restaurant_ID INTEGER NOT NULL REFERENCES Restaurant(ID),
  Type VARCHAR(255) NOT NULL,
  Phone_Number VARCHAR(255) NOT NULL
);

CREATE TABLE Table_Type (
  ID SERIAL PRIMARY KEY,
  Type VARCHAR(255) NOT NULL
);

CREATE TABLE Table (
  ID SERIAL PRIMARY KEY,
  Restaurant_ID INTEGER NOT NULL REFERENCES Restaurant(ID),
  Table_Type_ID INTEGER NOT NULL REFERENCES Table_Type(ID),
  Seat_Count INTEGER NOT NULL
);

CREATE TABLE Employee (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Surname VARCHAR(255) NOT NULL,
  Identification_Number VARCHAR(255) NOT NULL,
  Personal_Phone_Number VARCHAR(255) NOT NULL
);

CREATE TABLE Operator (
  ID SERIAL PRIMARY KEY,
  Employee_ID INTEGER NOT NULL REFERENCES Employee(ID),
  Restaurant_ID INTEGER NOT NULL REFERENCES Restaurant(ID)
);

CREATE TABLE Client (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Surname VARCHAR(255) NOT NULL,
  Phone_Number VARCHAR(255) NOT NULL,
  Comment VARCHAR(255)
);

CREATE TABLE Reservation (
  ID SERIAL PRIMARY KEY,
  Operator_ID INTEGER NOT NULL REFERENCES Operator(ID),
  Client_ID INTEGER NOT NULL REFERENCES Client(ID),
  Restaurant_Location_ID INTEGER NOT NULL REFERENCES Restaurant_Location(ID),
  Table_ID INTEGER NOT NULL REFERENCES Table(ID),
  Date DATE NOT NULL,
  Time TIME NOT NULL,
  Offered BOOLEAN,
  Comment VARCHAR(255)
);