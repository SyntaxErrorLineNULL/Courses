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

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
    (6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),
    (3878, 'Scottsdale', 'USA', 'Arizona', 202705),
    (3965, 'Corona', 'USA', 'California', 124966),
    (3973, 'Concord', 'USA', 'California', 121780),
    (3977, 'Cedar Rapids', 'USA', 'Iowa', 120758),
    (3982, 'Coral Springs', 'USA', 'Florida', 117549),
    (4054, 'Fairfield', 'USA', 'California', 92256),
    (4058, 'Boulder', 'USA', 'California', 91238),
    (4061, 'Fall River', 'USA', 'Massachusetts', 90555);

SELECT * FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;

/**
  Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
 */

SELECT NAME FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

/**
  Select all
 */

SELECT * FROM CITY;

/**
  Select By ID
 */

SELECT * FROM CITY WHERE ID = 1661;

/**
  Japanese Cities' Attributes
 */

SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN';

/**
  Japanese Cities' Names
 */

SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';

/**
  Weather Observation Station 1
 */

SELECT CITY, STATE FROM STATION;