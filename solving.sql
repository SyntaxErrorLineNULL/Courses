/**
  Theme: Select data
 */

 /**
   1.2.1 task
  */
SELECT * FROM book;

/**
  1.2.2
 */
SELECT author, title, price FROM book;

/**
  1.2.3
 */
SELECT title as "Название", author as "Автор" FROM book;

/**
  1.2.4
 */
SELECT title, amount, amount * 1.65 as "pack" FROM book;

/**
  1.2.5
 */
SELECT title, author, amount, round((price*0.7),2) as new_price FROM book;

/**
  1.2.6
 */
SELECT author, title,
       round(if(author="Булгаков М.А.", price*1.1, if(author="Есенин С.А.", price*1.05, price)), 2) as new_price
FROM book;

/**
  1.2.7
 */
SELECT author, title, price FROM book WHERE amount < 10;

/**
  1.2.8
 */
SELECT title, author, price, amount FROM book WHERE price < 500 AND price*amount >= 5000 OR price > 600 AND price*amount >= 5000

/**
  1.2.9
 */
SELECT title, author FROM book WHERE price BETWEEN 540.50 and 800 and amount in(2,3,5,7)

/**
  1.2.10
 */
SELECT title, author FROM book WHERE title LIKE '%_%' AND author LIKE '%С.%'

/**
  1.2.11
 */
SELECT author, title FROM book WHERE amount BETWEEN 2 AND 14 ORDER BY author DESC, title

/**
  1.2.12
  Add several query
 */
SELECT * FROM book WHERE author LIKE '%Ес%';
/**
    The store considered that the classics are no longer popular, therefore it is necessary in the sample:
    1. Change all authors to "Dontsova Daria".
    2. At the beginning, add "Evlampy Romanova and" to the title of each book.
    3. To raise the price by 42%.
    4. Sort by price descending and name descending.
 */
SELECT "Донцова Дарья" AS author, CONCAT("Евлампия Романова и ", title) AS title, round((price*1.42),2) AS price FROM book ORDER BY author, title DESC;

