CREATE TABLE trip (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    city VARCHAR(25),
    per_diem DECIMAL(8,2),
    date_first DATE,
    date_last DATE
);

INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (1, 'Баранов П.Е.', 'Москва', 700, '2020-01-12', '2020-01-17');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (2, 'Абрамова К.А.', 'Владивосток', 450, '2020-01-14', '2020-01-27');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (3, 'Семенов И.В.', 'Москва', 700, '2020-01-23', '2020-01-31');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (4, 'Ильиных Г.Р.', 'Владивосток', 450, '2020-01-12', '2020-02-02');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (5, 'Колесов С.П.', 'Москва', 700, '2020-02-01', '2020-02-06');

INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (6, 'Баранов П.Е.', 'Москва', 700, '2020-02-14', '2020-02-22');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (7, 'Абрамова К.А.', 'Москва', 700, '2020-02-23', '2020-03-01');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (8, 'Лебедев Т.К.', 'Москва', 700, '2020-03-03 	', '2020-03-06');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (9, 'Колесов С.П.', 'Новосибирск', 450, '2020-02-27', '2020-03-12');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (10, 'Семенов И.В.', 'Санкт-Петербург', 700, '2020-03-29', '2020-04-05');

INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (11, 'Абрамова К.А.', 'Москва', 700, '2020-04-06', '2020-04-14');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (12, 'Баранов П.Е.', 'Новосибирск', 450, '2020-04-18', '2020-05-04');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (13, 'Лебедев Т.К.', 'Томск', 450, '2020-05-20', '2020-05-31');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (14, 'Семенов И.В.', 'Санкт-Петербург', 700, '2020-06-01', '2020-06-03');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (15, 'Абрамова К.А.', 'Санкт-Петербург', 700, '2020-05-28', '2020-06-04');

INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (16, 'Федорова А.Ю.', 'Новосибирск', 450, '2020-05-25', '2020-06-04');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (17, 'Колесов С.П.', 'Новосибирск', 450, '2020-06-03', '2020-06-12');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (18, 'Федорова А.Ю.', 'Томск', 450, '2020-06-20', '2020-06-26');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (19, 'Абрамова К.А.', 'Владивосток', 450, '2020-07-02', '2020-07-13');
INSERT INTO trip (trip_id, name, city, per_diem, date_first, date_last) VALUES (20, 'Баранов П.Е.', 'Воронеж', 450, '2020-07-19', '2020-07-25');
