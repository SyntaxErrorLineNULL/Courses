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
  2.2.1
  Вывести название, жанр и цену тех книг, количество которых больше 8, в отсортированном по убыванию цены виде.
 */

SELECT title, name_genre, price
FROM book INNER JOIN genre
    ON genre.genre_id = book.genre_id
WHERE amount > 8
ORDER BY price DESC;

