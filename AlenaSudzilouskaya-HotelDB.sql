DROP DATABASE IF EXISTS AlenaSudzilouskayaHotelDB;
CREATE DATABASE AlenaSudzilouskayaHotelDB;
USE AlenaSudzilouskayaHotelDB;

CREATE TABLE Guest (
guestId INT AUTO_INCREMENT PRIMARY KEY,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
phoneNumber VARCHAR(15) NOT NULL,
address VARCHAR(50),
city VARCHAR(25),
state CHAR(2),
zip CHAR(5),
CONSTRAINT uc_Guest UNIQUE (firstName,lastName,phoneNumber)
);
CREATE TABLE Amenity (
amenityId INT AUTO_INCREMENT PRIMARY KEY,
amenityName VARCHAR(25) NOT NULL
);
CREATE TABLE RoomType (
roomTypeId INT AUTO_INCREMENT PRIMARY KEY,
typeName VARCHAR(15) NOT NULL,
standardOccupancy TINYINT NOT NULL,
maximumOccupancy TINYINT NOT NULL,
extraPerson DECIMAL(4,2)
);
CREATE TABLE RoomTypePrice (
roomTypePriceId INT AUTO_INCREMENT PRIMARY KEY,
roomTypeId INT NOT NULL,
adaAccessible BOOL NOT NULL,
basePrice DECIMAL(5,2) NOT NULL,
CONSTRAINT fk_RoomTypePrice_RoomType
	FOREIGN KEY (roomTypeId) REFERENCES RoomType (roomTypeId)
);
CREATE TABLE RoomTypePriceAmenity (
roomTypePriceId INT NOT NULL,
amenityId INT NOT NULL,
CONSTRAINT pk_RoomTypePriceAmenity PRIMARY KEY (roomTypePriceId, amenityId),
CONSTRAINT fk_RoomTypePriceAmenity_RoomTypePrice
	FOREIGN KEY (roomTypePriceId) REFERENCES RoomTypePrice (roomTypePriceId),
CONSTRAINT fk_RoomTypePriceAmenity_Amenity
	FOREIGN KEY (amenityId) REFERENCES Amenity (amenityId)
);
CREATE TABLE Room (
roomNumber SMALLINT PRIMARY KEY,
roomTypePriceId INT NOT NULL,
CONSTRAINT fk_Room_RoomTypePriceId
	FOREIGN KEY (roomTypePriceId) REFERENCES RoomTypePrice (roomTypePriceId)
);
CREATE TABLE Reservation (
reservationId INT AUTO_INCREMENT PRIMARY KEY,
roomNumber SMALLINT,
guestId INT,
adults TINYINT NOT NULL,
children TINYINT NOT NULL,
startDate DATE NOT NULL,
endDate DATE NOT NULL,
totalCost DECIMAL(6,2) NOT NULL,
CONSTRAINT fk_Reservation_Room
	FOREIGN KEY (roomNumber) REFERENCES Room (roomNumber),
CONSTRAINT fk_Reservation_Guest
	FOREIGN KEY (guestId) REFERENCES Guest (guestId)
);