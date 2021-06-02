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