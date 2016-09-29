create table CONFERENCES (
    ID INT PRIMARY KEY NOT NULL,
    CITY VARCHAR(80) NOT NULL,
    AIRPORT CHAR(3),
    SEATS INT  
);
create table SHUTTLES (
    ID INT PRIMARY KEY NOT NULL,
    AIRPORT CHAR(3),
    TIME TIME,
    SEATS INT  
);



INSERT INTO `tomcat`.`CONFERENCES` (`ID`, `CITY`, `AIRPORT`, `SEATS`) VALUES ('1', 'Austin', 'AUS', '37'), ('2', 'Boston', 'BTN', '0'), ('3', 'Huston', 'HTN', '11'), ('4', 'Los Angles', 'LSA', '33'), ('5', 'New York', 'NWY', '0');

INSERT INTO `tomcat`.`CONFERENCES` (`ID`, `CITY`, `AIRPORT`, `SEATS`) VALUES ('6', 'San Francisco', 'SNF', '12');

INSERT INTO `tomcat`.`SHUTTLES` (`ID`, `AIRPORT`, `TIME`, `SEATS`) VALUES ('1', 'AUS', '14:15:00', '0'), ('2', 'AUS', '12:00:00', '9');

INSERT INTO `tomcat`.`SHUTTLES` (`ID`, `AIRPORT`, `TIME`, `SEATS`) VALUES ('3', 'AUS', '09:40:00', '8');