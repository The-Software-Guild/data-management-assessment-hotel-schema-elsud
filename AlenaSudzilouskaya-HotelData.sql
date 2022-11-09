USE AlenaSudzilouskayaHotelDB;
INSERT INTO Amenity (amenityName) VALUES
	('Microwave'),
    ('Jacuzzi'),
    ('Refrigerator'),
    ('Oven');
INSERT INTO RoomType (typeName, standardOccupancy, maximumOccupancy, extraPerson) VALUES
	('Double', 2, 4, 10),
    ('Single', 2, 2, NULL),
    ('Suite', 3, 8, 20);
INSERT INTO RoomTypePrice (roomtypeId, adaAccessible, basePrice) VALUES
	(1, false, 199.99),
    (1, true, 174.99),
    (2, false, 174.99),
    (2, true, 149.99),
    (3, true, 399.99);
INSERT INTO RoomTypePriceAmenity (roomTypePriceId, amenityId) VALUES
	(1, 1),
    (1, 2),
    (2, 3),
    (3, 1),
    (3, 2),
    (3, 3),
    (4, 1),
    (4, 3),
    (5, 1),
    (5, 3),
    (5, 4);
INSERT INTO Room (roomNumber, roomTypePriceId) VALUES
	(201, 1),
    (202, 2),
    (203, 1),
    (204, 2),
    (205, 3),
    (206, 4),
    (207, 3),
    (208, 4),
    (301, 1),
    (302, 2),
    (303, 1),
    (304, 2),
    (305, 3),
    (306, 4),
    (307, 3),
    (308, 4),
    (401, 5),
    (402, 5);
INSERT INTO Guest (firstName, lastName, phoneNumber, address, city, state, zip) VALUES
		('Alena', 'Sudzilouskaya', '(234)567-8901', '123 Blue Beach Street', 'Orlando', 'FL', '34567'),
        ('Mack', 'Simmer', '(291) 553-0508', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501'),
        ('Bettyann', 'Seery', '(478) 277-9632', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654'),
        ('Duane', 'Cullison', '(308) 494-0198', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552'),
        ('Karie', 'Yang', '(214) 730-0298',	'9378 W. Augusta Ave.',	'West Deptford', 'NJ', '08096'),
        ('Aurore', 'Lipton', '(377) 507-0974', '762 Wild Rose Street', 'Saginaw', 'MI', '48601'),
        ('Zachery', 'Luechtefeld', '(814) 485-2615', '7 Poplar Dr.', 'Arvada', 'CO', '80003'),
        ('Jeremiah', 'Pendergrass',	'(279) 491-0960', '70 Oakwood St.',	'Zion',	'IL', '60099'),
        ('Walter', 'Holaway', '(446) 396-6785', '7556 Arrowhead St.',	'Cumberland', 'RI', '02864'),
        ('Wilfred', 'Vise', '(834) 727-1001', '77 West Surrey Street', 'Oswego', 'NY', '13126'),
        ('Maritza', 'Tilton', '(446) 351-6860',	'939 Linda Rd.', 'Burke', 'VA',	'22015'),
        ('Joleen', 'Tison', '(231) 893-2755', '87 Queen St.', 'Drexel Hill', 'PA', '19026');
INSERT INTO Reservation (roomNumber, guestId, adults, children, startDate, endDate, totalCost) VALUES
	(308, 2, 1, 0, '2023-02-02', '2023-02-04', 299.98),
    (203, 3, 2, 1, '2023-02-05', '2023-02-10', 999.95),
    (305, 4, 2, 0, '2023-02-22', '2023-02-24', 349.98),
    (201, 5, 2, 2, '2023-03-06', '2023-03-07', 199.99),
    (307, 1, 1,	1, '2023-03-17', '2023-03-20', 524.97),
    (302, 6, 3, 0, '2023-03-18', '2023-03-23', 924.95),
    (202, 7, 2, 2, '2023-03-29', '2023-03-31', 349.98),
    (304, 8, 2, 0, '2023-03-31', '2023-04-05', 874.95),
    (301, 9, 1, 0, '2023-04-09', '2023-04-13', 799.96),
    (207, 10, 1, 1, '2023-04-23', '2023-04-24', 174.99),
    (401, 11, 2, 4, '2023-05-30', '2023-06-02', 1199.97),
    (206, 12, 2, 0, '2023-06-10', '2023-06-14', 599.96),
    (208, 12, 1, 0, '2023-06-10', '2023-06-14', 599.96),
    (304, 6, 3, 0, '2023-06-17', '2023-06-18', 184.99),
    (205, 1, 2, 0, '2023-06-28', '2023-07-02', 699.96),
    (204, 9, 3, 1, '2023-07-13', '2023-07-14', 184.99),
    (401, 10, 4, 2, '2023-07-18', '2023-07-21', 1259.97),
    (303, 3, 2, 1, '2023-07-28', '2023-07-29', 199.99),
    (305, 3, 1, 0, '2023-08-30', '2023-09-01', 349.98),
    (208, 2, 2, 0, '2023-09-16', '2023-09-17', 149.99),
    (203, 5, 2, 2, '2023-09-13', '2023-09-15', 399.98),
    (401, 4, 2, 2, '2023-11-22', '2023-11-25', 1199.97),
    (206, 2, 2, 0, '2023-11-22', '2023-11-25', 449.97),
    (301, 2, 2, 2, '2023-11-22', '2023-11-25', 599.97),
    (302, 11, 2, 0, '2023-12-24', '2023-12-28', 699.96); 
DELETE FROM Reservation
	WHERE guestId=(SELECT guestId FROM Guest WHERE firstName='Jeremiah' AND lastName='Pendergrass');
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Guest WHERE firstName='Jeremiah' AND lastName='Pendergrass';
SET SQL_SAFE_UPDATES = 1;  
