--  Використовуєтсья для додавання даних (рядків) у таблицю
INSERT INTO users 
VALUES 
(1, 'First', 'User', 5000.01, true, '2005-12-28');
-- декілька користувачів
INSERT INTO users
VALUES
(2, 'Test', '2', 65465.12, false, '1996-4-4'),
(3,'Other','User', 0, true, '1980-6-7');
-- вказання порядку вставки даних
INSERT INTO users 
(balance, first_name, last_name, is_male, birthday)
VALUES
(1500, 'second', 'last', true,'2005-12-28' );