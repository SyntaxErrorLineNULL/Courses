/**
  Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
 */

CREATE TABLE CITY (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(17),
    COUNTRYCODE VARCHAR(3),
    DISTRICT VARCHAR(20),
    POPULATION INT
);

SELECT * FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;