USE AlenaSudzilouskayaHotelDB;

# 1.Write a query that returns a list of reservations that end in July 2023,
# including the name of the guest, the room number(s), and the reservation dates
SELECT CONCAT(g.firstname, ' ', g.lastName) guestName, r.roomNumber, r.startDate, r.endDate
FROM Reservation r
INNER JOIN Guest g ON g.guestId=r.guestId
WHERE r.endDate BETWEEN '2023-07-01' AND '2023-07-31';
# +---------------------+------------+------------+------------+
# | guestName           | roomNumber | startDate  | endDate    |
# +---------------------+------------+------------+------------+
# | Alena Sudzilouskaya |        205 | 2023-06-28 | 2023-07-02 |
# | Walter Holaway      |        204 | 2023-07-13 | 2023-07-14 |
# | Wilfred Vise        |        401 | 2023-07-18 | 2023-07-21 |
# | Bettyann Seery      |        303 | 2023-07-28 | 2023-07-29 |
# +---------------------+------------+------------+------------+

# 2.Write a query that returns a list of all reservations for rooms with a jacuzzi,
# displaying the guest's name, the room number, and the dates of the reservation.
SELECT CONCAT(g.firstName, ' ', g.lastName) guestName, r.roomNumber, r.startDate, r.endDate
FROM Reservation r
INNER JOIN Guest g ON g.guestId=r.guestId
INNER JOIN Room ON r.roomNumber=Room.roomNumber
INNER JOIN RoomTypePriceAmenity rtpa ON rtpa.roomTypePriceId=Room.roomTypePriceId
INNER JOIN Amenity a ON a.amenityId=rtpa.amenityId
WHERE a.amenityName='Jacuzzi';
# +---------------------+------------+------------+------------+
# | guestName           | roomNumber | startDate  | endDate    |
# +---------------------+------------+------------+------------+
# | Karie Yang          |        201 | 2023-03-06 | 2023-03-07 |
# | Bettyann Seery      |        203 | 2023-02-05 | 2023-02-10 |
# | Karie Yang          |        203 | 2023-09-13 | 2023-09-15 |
# | Walter Holaway      |        301 | 2023-04-09 | 2023-04-13 |
# | Mack Simmer         |        301 | 2023-11-22 | 2023-11-25 |
# | Bettyann Seery      |        303 | 2023-07-28 | 2023-07-29 |
# | Alena Sudzilouskaya |        205 | 2023-06-28 | 2023-07-02 |
# | Wilfred Vise        |        207 | 2023-04-23 | 2023-04-24 |
# | Duane Cullison      |        305 | 2023-02-22 | 2023-02-24 |
# | Bettyann Seery      |        305 | 2023-08-30 | 2023-09-01 |
# | Alena Sudzilouskaya |        307 | 2023-03-17 | 2023-03-20 |
# +---------------------+------------+------------+------------+

# 3.Write a query that returns all the rooms reserved for a specific guest, including the guest's name,
# the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation.
# (Choose a guest's name from the existing data.)
SELECT CONCAT(g.firstName, ' ', g.lastName) guestName, r.roomNumber, r.startDate, r.adults+r.children people
FROM Reservation r
INNER JOIN Guest g ON g.guestId=r.guestId
WHERE g.firstName='Mack' AND g.lastName='Simmer'
ORDER BY r.startDate ASC;
# +-------------+------------+------------+--------+
# | guestName   | roomNumber | startDate  | people |
# +-------------+------------+------------+--------+
# | Mack Simmer |        308 | 2023-02-02 |      1 |
# | Mack Simmer |        208 | 2023-09-16 |      2 |
# | Mack Simmer |        206 | 2023-11-22 |      2 |
# | Mack Simmer |        301 | 2023-11-22 |      4 |
# +-------------+------------+------------+--------+

# 4.Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation.
# The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT r.roomNumber, IFNULL(res.reservationId, '-') reservationId, IFNULL(res.totalCost, 0) totalCost
FROM Room r
LEFT OUTER JOIN Reservation res ON r.roomNumber=res.roomNumber
ORDER BY r.roomNumber;
# +------------+---------------+-----------+
# | roomNumber | reservationId | totalCost |
# +------------+---------------+-----------+
# |        201 | 4             |    199.99 |
# |        202 | 7             |    349.98 |
# |        203 | 2             |    999.95 |
# |        203 | 21            |    399.98 |
# |        204 | 16            |    184.99 |
# |        205 | 15            |    699.96 |
# |        206 | 12            |    599.96 |
# |        206 | 23            |    449.97 |
# |        207 | 10            |    174.99 |
# |        208 | 13            |    599.96 |
# |        208 | 20            |    149.99 |
# |        301 | 9             |    799.96 |
# |        301 | 24            |    599.97 |
# |        302 | 6             |    924.95 |
# |        302 | 25            |    699.96 |
# |        303 | 18            |    199.99 |
# |        304 | 14            |    184.99 |
# |        305 | 3             |    349.98 |
# |        305 | 19            |    349.98 |
# |        306 | -             |      0.00 |
# |        307 | 5             |    524.97 |
# |        308 | 1             |    299.98 |
# |        401 | 11            |   1199.97 |
# |        401 | 17            |   1259.97 |
# |        401 | 22            |   1199.97 |
# |        402 | -             |      0.00 |
# +------------+---------------+-----------+

# 5.Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.
SELECT r.roomNumber FROM Room r
INNER JOIN RoomTypePrice rtp ON rtp.roomTypePriceId=r.roomTypePriceId
INNER JOIN RoomType rt ON rt.roomTypeId=rtp.roomTypeId
INNER JOIN Reservation res ON res.roomNumber=r.roomNumber
WHERE rt.maximumOccupancy>=3 AND (res.startDate BETWEEN '2023-04-01' AND '2023-04-30' OR res.endDate BETWEEN '2023-04-01' AND '2023-04-30');
# +------------+
# | roomNumber |
# +------------+
# |        301 |
# +------------+

# 6.Write a query that returns a list of all guest names and the number of reservations per guest,
# sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT CONCAT(g.firstName, ' ', g.lastName) guestName, COUNT(r.reservationId)
FROM Guest g
LEFT OUTER JOIN Reservation r ON r.guestId=g.guestId
GROUP BY (g.guestId)
ORDER BY COUNT(r.reservationId) DESC, g.lastName;
# +---------------------+------------------------+
# | guestName           | COUNT(r.reservationId) |
# +---------------------+------------------------+
# | Mack Simmer         |                      4 |
# | Bettyann Seery      |                      3 |
# | Duane Cullison      |                      2 |
# | Walter Holaway      |                      2 |
# | Aurore Lipton       |                      2 |
# | Alena Sudzilouskaya |                      2 |
# | Maritza Tilton      |                      2 |
# | Joleen Tison        |                      2 |
# | Wilfred Vise        |                      2 |
# | Karie Yang          |                      2 |
# | Zachery Luechtefeld |                      1 |
# +---------------------+------------------------+

# 7.Write a query that displays the name, address, and phone number of a guest based on their phone number.
# (Choose a phone number from the existing data.)
SELECT CONCAT(firstName, ' ', lastName) guestName, address, phoneNumber
FROM Guest
WHERE phoneNumber='(814) 485-2615';
# +---------------------+--------------+----------------+
# | guestName           | address      | phoneNumber    |
# +---------------------+--------------+----------------+
# | Zachery Luechtefeld | 7 Poplar Dr. | (814) 485-2615 |
# +---------------------+--------------+----------------+