DROP DATABASE LAB_9
GO

CREATE DATABASE LAB_9
GO
USE LAB9
GO

create table SAILOR
(
	SailorID int primary key,
	SailorName varchar(50),
	Phone varchar(50),
	City varchar(50)
)

create table OWNER
(
	OwnerID int primary key,
	OwnerName varchar(50),
	Phone varchar(50),
	City varchar(50),
	Country varchar(50)
)

create table BOAT
(
	BoatName varchar(50) primary key,
	BoatType varchar(50),
	Price int,
	OwnerID int,
	Foreign key (OwnerID) references [dbo].[OWNER](OwnerID)
)

create table RESERVATION
(
	ReserveID int primary key,
	SailorID int,
	BoatName varchar(50),
	Date date,
	[Day] varchar(25),
	Foreign key (SailorID) references SAILOR(SailorID),
	Foreign key (BoatName) references BOAT(BoatName)
)

create table RESERVATION_DAYS
(
	ID int primary key identity(1,1),
	WeekDay varchar(25)
)

Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (1, 'Salar But', '123-123-123', 'Lahore' )
Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (2, 'Ahmad Jabbar' , '123-123-123', 'Karachi' )
Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (3, 'Sumair Tayyab', '123-123-123', 'Karachi' )
Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (4, 'Bilal Ahmad', '123-123-123', 'Sialkot' )
Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (5, 'Ali Hafiz', '123-123-123', 'Lahore' )

Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (1,'John Silver','123-123-123','Birmingham','England')
Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (2,'Shane Micheal','123-123-123','Bradford','England')
Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (3,'Ahmad Jabbar','123-123-123','Multan','Pakistan')
Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (4,'Furqan Ali','123-123-123','Sakkhar','Pakistan')
Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (5,'Faheem Abid','123-123-123','Lahore','Pakistan')
 
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Hang Loose','Cabin_cruise',5000000,1)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Southern Comfort','Motor_boat',1000000,1)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Kitty Crew','Motor_boat',6000000,1)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Lounge Lizard','Motor_boat',2000000,1)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Safe Seamen','Raft',5000000,2)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Double Dollars','Cabin_cruise',5000000,3)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Titanic','Cabin_cruise',8000000,3)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Wet Dream','Airboat',700000,3)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Crew Lounge','Fishing',300000,4)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Aga','Fishing',100000,4)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('A Fish Too Far ','Cabin_cruise',8000000,4)

Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (1,1,'A Fish Too Far','10-06-2014', 'Thursday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (2,1,'Hang Loose','06-07-2014', 'Monday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (3,1,'Double Dollars','02-08-2014', 'Sunday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (4,2,'Crew Lounge','03-08-2014', 'Thursday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (5,3,'Wet Dream','10-09-2014', 'Sunday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (6,4,'Titanic','10-09-2014', 'Saturday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (7,4,'Aga','10-09-2014', 'Thursday')

Insert into RESERVATION_DAYS(weekday) VALUES ('Sunday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Monday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Tuesday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Wednesday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Thursday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Friday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Saturday')

SELECT * FROM SAILOR
SELECT * FROM [OWNER]
SELECT * FROM BOAT
SELECT * FROM RESERVATION
SELECT * FROM RESERVATION_DAYS

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TASK 1 CREATING A VIEW
CREATE VIEW [VIEW1] 
AS
SELECT DISTINCT(O.OWNERID), O.OWNERNAME, B.BoatName, B.BoatType, B.PRICE
FROM OWNER O JOIN BOAT B ON O.OWNERID = B.OWNERID

-- DISPLAY 
SELECT * FROM VIEW1
ORDER BY OWNERID

																	---------------------------------------------
-- TASK 2
CREATE VIEW [VIEW3]
AS
SELECT DISTINCT(S.SAILORID), R.RESERVEID, R.BOATNAME, R.DATE, R.[DAY]
FROM SAILOR S JOIN RESERVATION R ON S.SailorID = R.SAILORID JOIN BOAT B ON R.BOATNAME = B.BOATNAME

-- DISPLAY RESULT ON SCREEN
SELECT * FROM VIEW3
																	---------------------------------------------

-- TASK 3
CREATE PROCEDURE PROCA
AS
SELECT OWNERNAME, COUNT(*) AS [BOATS OWNED]
FROM VIEW1
GROUP BY OWNERNAME

-- EXECUTE THE VIEW
EXECUTE PROCA
																   ---------------------------------------------	
-- TASK 4
CREATE VIEW insertion
AS
SELECT * FROM [OWNER] O with check option

Select * from insertion

CREATE VIEW insertionintoboat
AS 
SELECT * FROM BOAT with check option
INSERT INTO insertion values(10,'Hammad','145-145-145','Islamabad','Pakistan');

																	---------------------------------------------
-- Task 5
CREATE TRIGGER TRIG1
ON BOAT
instead of insert, update, delete
AS
BEGIN
print('SOMEONE IS DOING FISHY FISHY WORK');
END
GO

ENABLE TRIGGER TRIG1
on BOAT;

Insert into BOAT(BoatName, BoatType, Price, OwnerID) VALUES ('Kevin Nash','Fishing1',540000, 2)

																	----------------------------------------------
-- Task 6
CREATE TRIGGER TRIG2 
on OWNER
instead of insert
AS
BEGIN
print('INSERTED SUCCESSFULLY')
END
go

ENABLE TRIGGER insertion 
on OWNER;
Insert into OWNER(OwnerID, OwnerName, Phone, City, Country) VALUES (6,'Ali Murtaza','673-234-123','Karachi','Paakistan')

