/**
  2.1
  Создать таблицу author следующей структуры:
 */

CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name_author VARCHAR(50)
);

/**
  2.2
  Заполнить таблицу author.
 */

INSERT INTO author (author_id, name_author) VALUES
    (1, 'Булгаков М.А.'),
    (2, 'Достоевский Ф.М.'),
    (3, 'Есенин С.А.'),
    (4, 'Пастернак Б.Л.');

/**
  2.3
  Перепишите запрос на создание таблицы book , чтобы ее структура соответствовала структуре, показанной на логической схеме
  (таблица genre уже создана, порядок следования столбцов - как на логической схеме в таблице book, genre_id  - внешний ключ) .
  Для genre_id ограничение о недопустимости пустых значений не задавать. В качестве главной таблицы для описания поля  genre_id
 */

CREATE TABLE genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    name_genre VARCHAR(50)
);

CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    author_id INT NOT NULL,
    genre_id INT,
    price DECIMAL(8,2),
    amount INT,
    FOREIGN KEY (author_id)  REFERENCES author (author_id),
    FOREIGN KEY (genre_id)  REFERENCES genre (genre_id)
);

/**
  2.4
  Создать таблицу book той же структуры, что и на предыдущем шаге.
  Будем считать, что при удалении автора из таблицы author, должны удаляться все записи о книгах из таблицы book, написанные этим автором.
  А при удалении жанра из таблицы genre для соответствующей записи book установить значение Null в столбце genre_id.
 */

CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    author_id INT NOT NULL,
    genre_id INT,
    price DECIMAL(8,2),
    amount INT,
    FOREIGN KEY (author_id)  REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id)  REFERENCES genre (genre_id) ON DELETE SET NULL
);

/**
  2.5
 */

INSERT INTO book (book_id, title, author_id, genre_id, price, amount) VALUES
    (6, 'Стихотворения и поэмы', 3, 2, 650.00, 15),
    (7, 'Черный человек', 3, 2, 570.20, 6),
    (8, 'Лирика', 4, 2, 518.99, 2);

/** DATABASE */

CREATE TABLE author (
    author_id serial PRIMARY KEY,
    name_author VARCHAR(50)
);

INSERT INTO author (name_author) VALUES
    ('Булгаков М.А.'),
    ('Достоевский Ф.М.'),
    ('Есенин С.А.'),
    ('Пастернак Б.Л.');

CREATE TABLE genre(
    genre_id serial PRIMARY KEY,
    name_genre varchar(30)
);

INSERT INTO genre (name_genre) VALUES
    ('Роман'),
    ('Поэзия'),
    ('Приключения');

CREATE TABLE book (
    book_id serial PRIMARY KEY,
    title VARCHAR(50),
    author_id INT NOT NULL,
    genre_id int,
    price DECIMAL(8, 2),
    amount INT,
    FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE SET NULL
);

INSERT INTO book (title, author_id, genre_id, price, amount) VALUES
    ('Мастер и Маргарита', 1, 1, 670.99, 3),
    ('Белая гвардия ', 1, 1, 540.50, 5),
    ('Идиот', 2, 1, 460.00, 10),
    ('Братья Карамазовы', 2, 1, 799.01, 3),
    ('Игрок', 2, 1, 480.50, 10),
    ('Стихотворения и поэмы', 3, 2, 650.00, 15),
    ('Черный человек', 3, 2, 570.20, 6),
    ('Лирика', 4, 2, 518.99, 2);

/**
  JOIN
 */

/**
  2.2.1 Example
  Вывести название книг и их авторов.
 */

SELECT title, name_author
FROM author INNER JOIN book
    ON author.author_id = book.author_id;

/**
  2.2.1 (INNER JOIN)
  Вывести название, жанр и цену тех книг, количество которых больше 8, в отсортированном по убыванию цены виде.
 */

SELECT title, name_genre, price
FROM book INNER JOIN genre
    ON genre.genre_id = book.genre_id
WHERE amount > 8
ORDER BY price DESC;


/**
  2.2.2 Example
  Вывести название всех книг каждого автора, если книг некоторых авторов в данный момент нет на складе – вместо названия книги указать Null
 */

SELECT name_author, title
FROM author LEFT JOIN book
    ON author.author_id = book.author_id
ORDER BY name_author;

/**
  2.2.2
  Вывести все жанры, которые не представлены в книгах на складе.
 */

SELECT name_genre
FROM genre LEFT JOIN book
    ON book.genre_id = genre.genre_id
WHERE amount IS NULL;

/**
  2.2.3 Example

 */

SELECT name_author, name_genre
FROM author, genre;

/**
  2.2.3
  Есть список городов, хранящийся в таблице city
 */

SELECT name_city, name_author, DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY) AS `Дата`
FROM author CROSS JOIN city
ORDER BY name_city, `Дата` DESC;

/**
  2.2.4
  Вывести информацию о тех книгах, их авторах и жанрах, цена которых принадлежит интервалу от 500  до 700 рублей  включительно.
 */

SELECT title, name_author, name_genre, price, amount
FROM author
    INNER JOIN  book ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE price BETWEEN 500 AND 700;

/**
  2.2.4
  Вывести информацию о книгах (жанр, книга, автор), относящихся к жанру, включающему слово «роман» в отсортированном по названиям книг виде.
 */

SELECT name_genre, title, name_author
FROM book
    INNER JOIN author
            ON book.author_id = author.author_id
    INNER JOIN genre
            ON book.genre_id = genre.genre_id
WHERE name_genre = 'Роман'
ORDER BY title;

/**
  2.2.5
 */

SELECT name_author, count(title) AS `Количество`
FROM author
    LEFT JOIN book
        ON author.author_id = book.author_id
GROUP BY name_author
ORDER BY name_author;

/**
  2.2.5
  Посчитать количество экземпляров  книг каждого автора из таблицы author.
  Вывести тех авторов,  количество книг которых меньше 10, в отсортированном по возрастанию количества виде.
  Последний столбец назвать Количество.
 */

SELECT name_author, SUM(amount) AS `Количество`
FROM author
LEFT JOIN book
    ON author.author_id = book.author_id
GROUP BY name_author
HAVING `Количество` < 10 OR `Количество` IS NULL
ORDER BY `Количество`;

/**
  2.2.6 Example
  Найдем суммарное количество книг на складе по каждому автору.
  Поскольку фамилии автора в этой таблице нет, то группировку будем осуществлять по author_id
 */

SELECT author_id, SUM(amount) AS sum_amount FROM book GROUP BY author_id;

/**
  2.2.6 Example
  В результирующей таблице предыдущего запроса необходимо найти максимальное значение, то есть 23.
  Для этого запросу, созданному на шаге 1, необходимо присвоить имя (например, query_in) и использовать его в качестве таблицы-источника
  после FROM. Затем уже находить максимум по столбцу sum_amount
 */

SELECT MAX(sum_amount) AS max_sum_amount
FROM (
    SELECT SUM(amount) AS sum_amount
    FROM book
    GROUP BY author_id
) query_in;

/**
  2.2.6 Example
  Выведем фамилию автора и общее количество книг для него.
 */

SELECT name_author, SUM(amount) as `Количество`
FROM author INNER JOIN book
    ON author.author_id = book.author_id
GROUP BY name_author;

/**
  2.2.6 Example
  Включим запрос с шага 2 в условие отбора запроса с шага 3. И получим всех авторов, общее количество книг которых максимально.
 */

SELECT name_author, SUM(amount) as `Количество`
FROM author
    INNER JOIN book
        ON author.author_id = book.author_id
GROUP BY name_author
HAVING SUM(amount) = (/* вычисляем максимальное из общего количества книг каждого автора */
    SELECT MAX(sum_amount) AS max_sum_amount
    FROM(/* считаем количество книг каждого автора */
           SELECT SUM(amount) AS sum_amount
           FROM book GROUP BY author_id
   ) query_in
);

