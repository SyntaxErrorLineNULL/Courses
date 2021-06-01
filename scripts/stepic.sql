/**
  Theme: Attitude (table)
 */

/**
  1.1.1
 */
CREATE TABLE book (book_id INT PRIMARY KEY auto_increment, title VARCHAR(50), author VARCHAR(30), price DECIMAL(8,2), amount INT);

/*
 1.1.2
 */
INSERT INTO book (book_id, title, author, price, amount) VALUES (1, "Мастер и Маргарита", "Булгаков М.А.", 670.99, 3);

/**
  1.1.3
 */
INSERT INTO book (book_id, title, author, price, amount) VALUES (2, "Белая гвардия", "Булгаков М.А.", 540.50, 5);
INSERT INTO book (book_id, title, author, price, amount) VALUES (3, "Идиот", "Достоевский Ф.М.", 460.00, 10);
INSERT INTO book (book_id, title, author, price, amount) VALUES (4, "Братья Карамазовы", "Достоевский Ф.М.", 799.01, 2);

/**
  Theme: Select data
 */

 /**
   1.2.1
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
SELECT title, author, price, amount FROM book WHERE price < 500 AND price*amount >= 5000 OR price > 600 AND price*amount >= 5000;

/**
  1.2.9
 */
SELECT title, author FROM book WHERE price BETWEEN 540.50 and 800 and amount in(2,3,5,7);

/**
  1.2.10
 */
SELECT title, author FROM book WHERE title LIKE '%_%' AND author LIKE '%С.%';

/**
  1.2.11
 */
SELECT author, title FROM book WHERE amount BETWEEN 2 AND 14 ORDER BY author DESC, title;

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

/**
  Theme: Queries, group operations
 */

 /**
   1.3.1
  */
SELECT DISTINCT amount FROM book;

/**
  1.3.2
 */
SELECT author AS "Автор", COUNT(author) AS "Различных_книг", SUM(amount) AS "Количество_экземпляров" FROM book GROUP BY author;

/**
  1.3.3
 */
SELECT author, MIN(price) AS "Минимальная_цена", MAX(price) AS "Максимальная_цена", AVG(price) AS "Средняя_цена" FROM book GROUP BY author;

/**
  1.3.4
 */
SELECT author, SUM(price*amount) AS "Стоимость", ROUND(SUM(price*amount)*0.18/1.18,2) AS "НДС", ROUND(SUM(price*amount)*1.18,2) AS "Стоимость_без_НДС" FROM book GROUP BY author;

/**
  1.3.5
 */
SELECT MIN(price) AS "Минимальная_цена", MAX(price) AS "Максимальная_цена", ROUND(AVG(price),2) AS "Средняя_цена" FROM book;

/**
  1.3.6
 */
SELECT ROUND(AVG(price),2) AS "Средняя_цена", ROUND(SUM(price*amount),2) AS "Стоимость" FROM book WHERE amount BETWEEN 5 and 14;

/**
  1.3.7
 */
SELECT author, SUM(price*amount) AS "Стоимость" FROM book WHERE title NOT IN ("Идиот", "Белая гвардия") GROUP BY author HAVING SUM(price*amount) >= 5000 ORDER BY Стоимость DESC;

/**
  1.3.8
 */
SELECT author, SUM(price*amount) AS "Стоимость" FROM book WHERE title NOT IN ("Идиот", "Белая гвардия") GROUP BY author HAVING SUM(price*amount) >= 5000 OR ROUND(AVG(price*amount)*1.56,2) ORDER BY Стоимость DESC;

/**
  Theme: Nested queries
 */

/**
  1.4.1
 */
SELECT author, title, price FROM book WHERE price <= (SELECT AVG(PRICE) FROM book) ORDER BY price DESC;

/**
  1.4.2
 */
SELECT author, title, price FROM book WHERE price - (SELECT MIN(price) FROM book) < 150 ORDER BY price ASC;

/**
  1.4.3
 */
SELECT author, title, amount FROM book WHERE amount IN (SELECT amount FROM book GROUP BY amount HAVING COUNT(amount)=1);

/**
  1.4.4
 */
SELECT author, title, price FROM book WHERE author in (SELECT author FROM book GROUP BY author HAVING AVG(price) > (SELECT AVG(price) FROM book));

/**
  1.4.4 update task
 */

SELECT author, title, price
FROM book
WHERE price < ANY (
    SELECT MIN(price)
    FROM book
    GROUP BY author
);

/**
  1.4.5
 */
SELECT title, author, amount, (SELECT MAX(amount) FROM book) - amount as `Заказ`
FROM book
HAVING `Заказ` > 0;

/**
  1.4.6
 */
SELECT *, round((100*price*amount/(SELECT SUM(price*amount) FROM book)), 2) AS income_percent FROM book ORDER BY income_percent DESC;

/**
  Theme: Data correction requests
 */

/**
  1.5.1
 */
CREATE TABLE supply (supply_id INT PRIMARY KEY auto_increment, title VARCHAR(50), author VARCHAR(30), price DECIMAL(8,2), amount INT);

/**
  1.5.2
 */
INSERT INTO supply(supply_id, title, author, price, amount) VALUES (1, 'Лирика', 'Пастернак Б.Л.', 518.99, 2);
INSERT INTO supply(supply_id, title, author, price, amount) VALUES (2, 'Черный человек', 'Есенин С.А.', 570.20, 6);
INSERT INTO supply(supply_id, title, author, price, amount) VALUES (3, 'Белая гвардия', 'Булгаков М.А.', 540.50, 7);
INSERT INTO supply(supply_id, title, author, price, amount) VALUES (4, 'Идиот', 'Достоевский Ф.М.', 360.80, 3);

/**
  1.5.3
 */
INSERT INTO book (title, author, price, amount) SELECT title, author, price, amount FROM supply WHERE author NOT IN('Булгаков М.А.', 'Достоевский Ф.М.');

/**
  1.5.4
 */
INSERT INTO book (title, author, price, amount) SELECT title, author, price, amount FROM supply WHERE author NOT IN(SELECT DISTINCT author FROM book);

/**
  1.5.5
 */
UPDATE book SET price = 0.9 * price WHERE amount BETWEEN 5 and 10;

/**
  1.5.6
 */
UPDATE book SET buy = IF(buy<=amount, buy, amount), price=IF(buy=0,price*0.9, price); SELECT * FROM book;

 /**
   1.5.7
  */
UPDATE book, supply SET book.amount=supply.amount+book.amount, book.price=(book.price+supply.price)/2 WHERE book.title=supply.title; SELECT * FROM book;

/**
  1.5.8
 */

