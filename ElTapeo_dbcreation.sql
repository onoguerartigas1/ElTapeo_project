/* ElTapeo database by JOSE SERRANO, CLAUDIA RIERA, ORIOL NOGUER*/

CREATE DATABASE ElTapeo_DB;
GO

USE ElTapeo_DB

/*Create tables */

CREATE TABLE Location_Table (
LocationID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED, 
ID AS 'L' + RIGHT ('00000' + CAST (LocationID AS VARCHAR (8)),8) PERSISTED, 
StoreName VARCHAR (30),
Address1 VARCHAR (50), 
City VARCHAR (15), 
State VARCHAR (10), 
ZipCode CHAR (5), 
StoreHours VARCHAR (80),
StorePhone VARCHAR (10) NOT NULL
); 


CREATE TABLE Customer (
CustomerID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED,
ID AS 'C' + RIGHT ('00000' + CAST (CustomerID AS VARCHAR (8)),8) PERSISTED, 
FirstName VARCHAR (50) NOT NULL,
LastName VARCHAR (50) NOT NULL,
BirthDate NUMERIC (8) NOT NULL, 
Phone NUMERIC (10) NOT NULL,
Email VARCHAR (50) NOT NULL,   
);


CREATE TABLE Employees (
EmployeeID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED, 
ID AS 'E' + RIGHT ('00' + CAST (EmployeeID AS VARCHAR (8)), 8) PERSISTED,
FirstName VARCHAR (50) NOT NULL, 
LastName VARCHAR (50) NOT NULL, 
Position VARCHAR (10) NOT NULL, 
Phone VARCHAR (10) NOT NULL,
Email VARCHAR (50) NOT NULL,  
Address1 VARCHAR (50) NOT NULL,  
City VARCHAR (20) NOT NULL,  
ZipCode CHAR (5) NOT NULL, 
LocationID INT NOT NULL FOREIGN KEY REFERENCES Location_Table(LocationID)
);


CREATE TABLE Orders (
OrderID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED, 
ID AS 'O' + RIGHT ('00'+ CAST(OrderID AS VARCHAR (8)),8) PERSISTED, 
AmountDue FLOAT (5) NOT NULL, 
CardType VARCHAR (50), 
DateOrder DATETIME CONSTRAINT DF_DateOrders1 DEFAULT (getdate()),
CustomerID INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
LocationID INT NOT NULL FOREIGN KEY REFERENCES Location_Table(LocationID)
);


CREATE TABLE MenuItem (
MenuItemID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED,
ID AS 'M' + RIGHT ('00' + CAST(MenuItemID AS VARCHAR (8)),8) PERSISTED, 
ItemName VARCHAR (50) NOT NULL, 
Price FLOAT (7) NOT NULL, 
Cost FLOAT (7) NOT NULL, 
ItemType VARCHAR (10) NOT NULL
);

CREATE TABLE OrderMenuDetails (
OrderMenuItemID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED, 
ID AS 'OM' + RIGHT ('00' + CAST(OrderMenuItemID AS VARCHAR (8)),8) PERSISTED, 
Quantity INT NOT NULL,
OrderID INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
MenuItemID INT NOT NULL FOREIGN KEY REFERENCES MenuItem(MenuItemID) 
);


/* Enter Data */

INSERT INTO dbo.Customer (FirstName, LastName, Email, Phone, BirthDate) VALUES 
('Kinsy', 'Laura', 'laura.kinsy1@harvard.edu', '7796594931', '11-02-89'),
('McCan', 'Susy', 'susymccan1@cambridge.edu', '5621509872', '08-23-95'),
('Rasy', 'Paola', 'prasyyy91@gmail.edu', '6903215390', '03-20-91'),
('Dasca', 'Jan', 'jdasca1@hotmail.edu', '9325678924', '06-27-88'),
('Orus', 'Joana', 'jowy.orus@gmail.edu', '6894367921', '12-25-94'),
('Bottichelli', 'Marco', 'rbottichelli90@harvard.edu', '5439687423', '01-23-90'),
('Venassi', 'Jhon', 'jhonvenassi92@yahoo.edu', '6579032156', '05-01-92'),
('Palomo', 'Gonzalo', 'gpalomo2@gmail.edu', '6903217546', '11-12-92'),
('Jhonson', 'Tyresse', 'tjhonsongray91@gmail.edu', '6239843675', '04-23-91'),
('Castro', 'Lionel', 'lcastro1@babson.edu', '4367984231', '09-13-96');
GO

INSERT INTO dbo.Location_Table(StoreName, Address1, City, State, ZipCode, StoreHours, StorePhone) VALUES
('ElTapeo Prudential', '840 Boylston St', 'Boston', 'MA', '02116', 'Monday-Sunday 11:00am-11:30pm', '6943210954'),
('ElTapeo BostonCommon', '52 Arlington St', 'Boston', 'MA', '02116', 'Monday-Sunday 11:00am-11:30pm', '6179160788'),
('ElTapeo Harvard', '45 Cambridge St', 'Cambridge', 'MA', '02138', 'Monday-Sunday 11:00am-11:30pm', '8346570921'),
('ElTapeo FinancialDistrict', '210 Congress St', 'Boston', 'MA', '02110', 'Monday-Sunday 11:00am-11:30pm', '6943205671'),
('ElTapeo South', '562 Harrison Ave', 'Boston', 'MA', '02118', 'Monday-Sunday 11:00am-11:30pm', '5128743092'),
('ElTapeo MadisonSquare', '5 W 32nd St', 'New York', 'NY', '10001', 'Monday-Sunday 11:00am-11:30pm', '8345012267'),
('ElTapeo TimesSquare', '322 W 51st St', 'New York', 'NY', '10019', 'Monday-Sunday 11:00am-11:30pm', '6982311233');
GO

INSERT INTO Employees(LastName, FirstName, Position, Phone, Email, Address1, City, ZipCode, LocationID) VALUES
('Honolo', 'Jenny', 'Waiter', '7586920394', 'jenny.ho@gmail.com', '43 Brigthon St', 'Boston', '02112', 91),
('Polou', 'George', 'Waiter', '2456835940', 'gperezramos@hotmail.com', '345 Ryland St Apt 4B', 'Boston', '02115', 92),
('Mundele', 'Remy', 'Waiter', '3456782938', 'mm234@gmail.com', '29 Lyndi St Box #32', 'Boston', '02123', 93),
('Presley', 'Robert', 'Manager', '4573214509', 'rrobert2@gmail.com', '32 Cambridge St Apt 3C','Boston', '02115', 94),
('Linnegart', 'Mary', 'Manager', '4556782934', 'mlinnegart94@yahoo.com', '32 Fenway Ave Box #345','Boston', '02111', 95),
('Glenn', 'Tyson', 'Waiter', '9842156830', 'tysonglen@gmail.com', '5 W 33th St Box #67', 'New York', '10023', 96),
('Carlos', 'Roberto', 'Waiter', '9087859203', 'rrrccc@hotmail.com', '5 W 32nd St Apt 4A', 'New York', '10011', 97),
('Presley', 'Tatianna', 'Manager', '6832199993', 'tatiii@gmail.com', '523 Principal Ave Apt 706', 'Boston', '02111', 91),
('Drew', 'Jhon', 'Waiter', '6002234811', 'jhon.drew@gmail.com', '4 Piki Ave Box #3897','Boston', '02114', 92),
('Ali', 'Mohammed', 'Waiter', '3456782938', 'mohamaali@yahoo.com', '43 Invernen Street Apt 7A', 'Boston', '02112', 93),
('Prentt', 'Sara', 'Manager', '9993049123', 'sara.prentt85@gmail.com', '101 Arts Way Apt 23', 'Boston', '02116', 94),
('Channel', 'Nancy', 'Waiter', '6732199883', 'nchannel@hotmail.com', '3 W 55nd St Box #567', 'New York', '10011', 95),
('Gutierrez', 'Rolando', 'Manager', '5233409821', 'rolandoo@gmail.com', '52 Linvigston St', 'Boston', '02115', 96),
('Scott', 'Robert', 'Waiter', '5554443312', 'scottrobert@gmail.com', '48 Palmwood Lane St Apt 12D', 'Boston', '02112', 97),
('Prentt', 'Peter', 'Waiter', '6222118873', 'prentt89@gmail.com', '56 London Ave Box #32', 'Boston', '02115', 91),
('Griffin', 'Jhon', 'Waiter', '2345678901', 'griffin.jhon@hotmail.com', '54 Landway St Box #56','Boston', '02113', 92),
('Madison', 'Linda', 'Manager', '3893200984',  'lindamadison@gmail.com', '86 Fenway St Apt 2A', 'Boston', '02115', 93),
('El-Akiti', 'Ralph', 'Manager', '6777095465', 'ralph@gmail.com', '5 W 33nd St Apt 2A', 'New York', '10012', 94);
GO

INSERT INTO Orders(CustomerID, AmountDue, CardType, LocationID) VALUES
(5, 25,'Master Card', 92),
(6, 35, 'Master Card', 96),
(7, 18, 'Visa', 94),
(8, 22, 'Visa', 91),
(9, 15, 'Visa', 93),
(10, 30, 'American Express', 97),
(11, 20, 'American Express', 93),
(12, 18, 'Master Card', 94);
GO

INSERT INTO MenuItem(ItemName, Price, Cost, ItemType) VALUES
('CroquetasIbericas', 5.50, 1.80, 'food'),
('JamonIberico', 7.00, 2.80, 'food'),
('TortillaPatatas', 5.50, 2.20, 'food'),
('Beer', 5.50, 1.50, 'drink'),
('QuesoBrieconJamon', 7.60, 2.20, 'food'),
('Patatasrellenas', 4.00, 2.00, 'food'),
('Pizzacasera', 4.30, 1.10, 'food'),
('Gazpacho', 5.00, 1.80, 'food'),
('PinchoTernera', 6.00, 2.20, 'food');
GO

INSERT INTO OrderMenuDetails(OrderID, MenuItemID, Quantity)VALUES
(10, 15, 2),
(10, 12, 2),
(11, 15, 1),
(11, 17, 1),
(12, 11, 3),
(13, 31, 1),
(13, 15, 4),
(14, 41, 5),
(14, 18, 1),
(15, 21, 3),
(16, 61, 2),
(16, 11, 3),
(16, 41, 2),
(17, 18, 1),
(17, 14, 1),
(17, 21, 1);
GO