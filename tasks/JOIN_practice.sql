-- Дані про товари (назва, ціна, кількість замовленго товару, категорія, виробник) у конкретному замовленні
SELECT p.name,
  p.price,
  p.quantity,
  p.category,
  p.manufacturer
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
WHERE order_id = 1;
-- Кількість одиниць куплених товарів певної категорії у конкретному замовлені (3 пляшки коли + 2 пачки ципсів = 5 товарів )
SELECT sum(p.quantity)
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
WHERE order_id = 2;
-- Кількість коментарів певного користувача з рейтингом більше 3
SELECT re.user_id,
  count(re.rating_id)
FROM reviews "re"
  JOIN ratings "ra" ON ra.id = re.rating_id
WHERE ra.rating > 3
GROUP BY re.user_id
ORDER BY re.user_id;
-- Кожне замовлення певного користувача зі статусом 'finished' та його загальна ціна
SELECT o.id, o.user_id, SUM(p.price*p.quantity), o.status
FROM orders "o"
  JOIN products_to_orders "pto" ON o.id = pto.order_id
  JOIN products "p" ON pto.product_id = p.id
WHERE o.status = 'finished'
GROUP BY (o.id, o.user_id)
ORDER BY o.id;
-- * Дані про найпопулярніший товар (товар який є в найбільшій кількості унікальних замовлень)
SELECT COUNT(o.id) "number of orders", p.id, p.name, p.category, p.price 
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
GROUP BY p.id
ORDER BY COUNT(o.id) DESC
LIMIT 1
;
-- ** Всі замовлення, кінцева вартість яких більше за 
--- середню вартість замовлення 
WITH avg_table AS (SELECT AVG(pto.quantity * p.price) "avg_of_all"
  FROM products "p"
    JOIN products_to_orders "pto" ON p.id = pto.product_id
    JOIN orders "o" ON pto.order_id = o.id)
    
SELECT AVG(pto.quantity * p.price) "avg_of_id", o.id
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
  JOIN avg_table "avg_t" ON 1=1
GROUP BY o.id, avg_t.avg_of_all
HAVING AVG(pto.quantity * p.price) > avg_t.avg_of_all
ORDER BY o.id;


--- підзапити для перевірки **
--усі продукти та кількість у 3ому замовлені
SELECT pto.quantity, p.price, o.id
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
WHERE o.id = 3;
-- середне та сумма кожного замовлення за ID
SELECT AVG(pto.quantity * p.price), SUM(pto.quantity * p.price), o.id
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
GROUP BY o.id
ORDER BY o.id;
--середне та сумма кожного замовлення
SELECT AVG(pto.quantity * p.price), SUM(pto.quantity * p.price)
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id;
-- повна таблиця з'єднань
WITH avg_table AS (SELECT AVG(pto.quantity * p.price) "avg_of_all"
  FROM products "p"
    JOIN products_to_orders "pto" ON p.id = pto.product_id
    JOIN orders "o" ON pto.order_id = o.id)
SELECT *
FROM products "p"
  JOIN products_to_orders "pto" ON p.id = pto.product_id
  JOIN orders "o" ON pto.order_id = o.id
  JOIN avg_table "avg_t" ON 1=1
ORDER BY o.id;