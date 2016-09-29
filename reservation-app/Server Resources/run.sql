create table CONFERENCES (
    ID INT PRIMARY KEY NOT NULL,
    CITY VARCHAR(80) NOT NULL,
    AIRPORT CHAR(3),
    SEATS INT  
);
create table SHUTTLES (
    ID INT NOT NULL,
    AIRPORT CHAR(3),
    TIME TIME,
    SEATS INT  
);



INSERT INTO CONFERENCES (ID, CITY, AIRPORT, SEATS) VALUES
(1, 'Austin', 'AUS', 9500),
(2, 'Boston', 'BTN', 0),
(3, 'Huston', 'HTN', 7800),
(4, 'Los Angles', 'LSA', 7900),
(5, 'New York', 'NWY', 0),
(6, 'San Francisco', 'SNF', 9800);


INSERT INTO SHUTTLES (ID, AIRPORT, TIME, SEATS) VALUES
(1, 'AUS', '14:15:00', 0),
(2, 'AUS', '12:00:00', 8000),
(3, 'AUS', '09:40:00', 5000),
(4, 'LSA', '09:40:00', 0),
(5, 'LSA', '12:00:00', 5000),
(6, 'LSA', '15:30:00', 2000),
(7, 'LSA', '09:45:00', 9000),
(8, 'SNF', '12:00:00', 8500),
(9, 'HTN', '15:30:00', 9500);
