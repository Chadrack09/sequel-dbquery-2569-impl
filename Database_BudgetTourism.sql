--========= PART 1 ~ CREATING AND INSERTING DATA INTO TABLE ===========    

--CREATE AND INSERT INTO TOUR_LEADER TABLE
CREATE TABLE TOUR_LEADER(
    tour_leader_id INT,
    leader_name VARCHAR2(255),
    CONSTRAINT tour_leader_pk PRIMARY KEY(tour_leader_id)
);
INSERT INTO TOUR_LEADER VALUES (1, 'Charles Samkelo');
INSERT INTO TOUR_LEADER VALUES (2, 'Sam Detroit');
INSERT INTO TOUR_LEADER VALUES (3, 'Robertson Alph');
INSERT INTO TOUR_LEADER VALUES (4, 'Caleb Memphis');


--CREATE AND INSERT INTO TOURS TABLE
CREATE TABLE TOURS(
    tour_id INT PRIMARY KEY NOT NULL,
    tour_leader_id INT REFERENCES TOUR_LEADER(tour_leader_id),
    description VARCHAR2(255),
    daily_rate INT,
    maximum INT,
    seats_available INT,
    departure_date DATE,
    CONSTRAINT check_daily_rate CHECK (daily_rate BETWEEN 1 AND 50),
    CONSTRAINT check_maximum CHECK (maximum <= 50)
);
INSERT INTO TOURS VALUES (1, 2, 'Visit Wine Industry, the experts at the industry will describe the process of wine tasting', 5, 5, 15, TO_DATE('20201005', 'YYYYMMDD'));
INSERT INTO TOURS VALUES (2, 4, 'Visit Table Mountain, Explore the beauty of Table Mountain', 3, 10, 15, TO_DATE('20201010', 'YYYYMMDD'));
INSERT INTO TOURS VALUES (3, 3, 'Visit Water Front', 6, 10, 20, TO_DATE('20201015', 'YYYYMMDD'));
INSERT INTO TOURS VALUES (4, 1, 'Visit Cape Town Beach', 5, 5, 15, TO_DATE('20201020', 'YYYYMMDD'));


--CREATE AND INSERT INTO TOURIST TABLE
CREATE TABLE TOURIST(
    tourist_id INT,
    name VARCHAR2(255),
    address VARCHAR2(255),
    tel_no VARCHAR2(255),
    CONSTRAINT tourist_id_pk PRIMARY KEY(tourist_id)
);
INSERT INTO TOURIST VALUES (101, 'Joe Warren', '1492 St. John Street, Malmesbury', '+27 21 452 1020');
INSERT INTO TOURIST VALUES (102, 'Sue Amstrong', '2230 Hoog St, Brakpan', '+27 67 785 1548');
INSERT INTO TOURIST VALUES (103, 'Vutu Zebani', '53 Tait St, Rustenburg', '+27 52 458 7854');
INSERT INTO TOURIST VALUES (104, 'Zobiwe Kloy', '282 Hoog St, Germiston', '+27 21 452 1020');
INSERT INTO TOURIST VALUES (105, 'Grant Simpson', '1886 Nelson Mandela Drive, Pietersburg', '+27 67 112 2535');
INSERT INTO TOURIST VALUES (106, 'Sarah Charter', '1112 Morgan Rd, Kwadlangezwa', '+27 45 789 1254');
INSERT INTO TOURIST VALUES (107, 'Helen Chin', '2186 Station Road, Pinetown', '+27 78 458 4895');
INSERT INTO TOURIST VALUES (108, 'Chris Koyela', '1032 Wolmarans St, Orange Grove', '+27 62 452 2583');
INSERT INTO TOURIST VALUES (109, 'Cyril Ramsone', '523 Oranje St, Wesselsbron', '+27 75 452 4658');
INSERT INTO TOURIST VALUES (110, 'Samson Pierlo', '45 Alexandra St, Iceberg', '+27 75 452 4658');


--CREATE AND INSERT INTO BOOKING TABLE
CREATE TABLE BOOKING(
    tour_id INT REFERENCES TOURS(tour_id),
    tourist_id INT REFERENCES TOURIST(tourist_id),
    seats_booked INT PRIMARY KEY,
    booking_price VARCHAR2(255)
);
INSERT INTO BOOKING VALUES (2, 102, 3001, 'R150.00');
INSERT INTO BOOKING VALUES (1, 109, 3002, 'R250.45');
INSERT INTO BOOKING VALUES (3, 110, 3003, 'R350.00');
INSERT INTO BOOKING VALUES (4, 101, 3004, 'R200.00');
INSERT INTO BOOKING VALUES (1, 108, 3005, 'R150.00');
INSERT INTO BOOKING VALUES (3, 106, 3006, 'R200.50');
INSERT INTO BOOKING VALUES (4, 104, 3007, 'R300.50');
INSERT INTO BOOKING VALUES (4, 103, 3008, 'R250.00');
INSERT INTO BOOKING VALUES (1, 105, 3009, 'R150.00');
INSERT INTO BOOKING VALUES (3, 107, 3010, 'R200.00');


--CREATE AND INSERT INTO DISCOUNT TABLE
CREATE TABLE DISCOUNT(
    tour_id_seat INT PRIMARY KEY,
    discount_per VARCHAR(255),
    CONSTRAINT DISCOUNT_BOOKING_FK FOREIGN KEY (tour_id_seat) REFERENCES BOOKING (seats_booked)
);
INSERT INTO DISCOUNT VALUES (3001, '5.50%');
INSERT INTO DISCOUNT VALUES (3002, '9.28%');
INSERT INTO DISCOUNT VALUES (3003, '14.17%');
INSERT INTO DISCOUNT VALUES (3004, '%6.75%');
INSERT INTO DISCOUNT VALUES (3005, '5.25%');
INSERT INTO DISCOUNT VALUES (3006, '0.00%');
INSERT INTO DISCOUNT VALUES (3007, '2.45%');
INSERT INTO DISCOUNT VALUES (3008, '3.50$');
INSERT INTO DISCOUNT VALUES (3009, '%8.75%');
INSERT INTO DISCOUNT VALUES (3010, '10.00%');




--====== PART 2 ~ UPDATE AND DELETE STATEMENT FOR ALL TABLES =======
--Please note this is the editing section, where data can be updated 
--or deleted in the tables.
--Ensure to remove comment tag, before implementing the Update or Delete commands.

--==== UPDATE STATEMENT
--TOUR LEADER TABLE
--UPDATE TOUR_LEADER SET leader_name = 'Robert Giben' WHERE tour_leader_id = 1;
--UPDATE TOUR_LEADER SET leader_name = 'Richard Columb' WHERE tour_leader_id = 2;
--UPDATE TOUR_LEADER SET leader_name = 'Samba Alphonse' WHERE tour_leader_id = 3;
--UPDATE TOUR_LEADER SET leader_name = 'Roberto Verba' WHERE tour_leader_id = 4;

--TOURS TABLE
--UPDATE TOURS SET description = 'Visit Cape Town Beatiful City', departure_date = TO_DATE('20200510', 'YYYYMMDD') WHERE tour_id = 1;
--UPDATE TOURS SET description = 'Visit Johannesburg City', departure_date = TO_DATE('20201001', 'YYYYMMDD') WHERE tour_id = 2;
--UPDATE TOURS SET daily_rate = 5, departure_date = TO_DATE('20200510', 'YYYYMMDD') WHERE tour_id = 3;
--UPDATE TOURS SET description = 'Visit Cape Town Beatiful City' WHERE tour_id = 4;

--TOURIST TABLE
--UPDATE TOURIST SET name = 'John Facer', address = '23 Alexandra St, Cape', tel_no = '+27 65 142 2345' WHERE tourist_id = 101; 
--UPDATE TOURIST SET name = 'Sam Denver', address = '32 Sameire St, Cape' WHERE tourist_id = 102; 
--UPDATE TOURIST SET address = '23 Roseta St, Cape', tel_no = '+27 67 152 2345' WHERE tourist_id = 103; 
--UPDATE TOURIST SET name = 'Evan Troy', tel_no = '+27 65 258 3654' WHERE tourist_id = 104; 
--UPDATE TOURIST SET name = 'Jacky Fanny', address = '23 Alexandra St, Cape', tel_no = '+27 65 142 7412' WHERE tourist_id = 105;

--BOOKING TABLE TABLE
--UPDATE BOOKING SET booking_price = 'R250.00' WHERE seats_booked = 3001;
--UPDATE BOOKING SET booking_price = 'R120.00' WHERE seats_booked = 3003;


--DISCOUNT TABLE
--UPDATE DISCOUNT SET discount_per = '0.50%' WHERE tour_id_seat = 3001;
--UPDATE DISCOUNT SET discount_per = '0.10%' WHERE tour_id_seat = 3002;


--==== DELETE STATEMENT
--Please note, the DELETE STATEMENT below, DELETE all data found in tables, please
--keep the order as It is from CHILD-TO-PARENT. Ensure to remove the commnent tag
--in order to implement
--DELETE FROM DISCOUNT;
--DELETE FROM BOOKING;
--DELETE FROM TOURIST;
--DELETE FROM TOURS;
--DELETE FROM TOUR_LEADER;


--In case, Tables have to be DROPPED or REMOVE from the Database 
--use the statements below. - Dropping from Child-To-Parent Tables -
--DROP TABLE DISCOUNT;
--DROP TABLE BOOKING;
--DROP TABLE TOURIST;
--DROP TABLE TOURS;
--DROP TABLE TOUR_LEADER;

--------------------------------------------------------------------------------

/*
    Cape Peninsula Unversity Of Technology
    Corner of Hanover and 
    Tennant Street Zonnebloem
    PO Box 652
    Cape Town
    8000

    Build using Oracle SQL Developer 
*/ 

--------------------------------------------------------------------------------