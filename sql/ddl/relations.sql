CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(250) NOT NULL,
  category VARCHAR(200),
  price NUMERIC(13,2) NOT NULL,
  quantity INT,
  "description" TEXT,
  created_at TIMESTAMP DEFAULT current_timestamp,
  updated_at TIMESTAMP DEFAULT current_timestamp
);
/*
  Види зв'язків сутностей у БД
    1 : 1 - один до одного
      ( у одної країни є один прапор, у одного прапора одна країна)
    1 : n - один до багатьох
      (в одній групі багато студентів, один студент занаходиться тількі в 1 групі)
      (у книжки один автор, у автора багато книжок)
    n : m - багато до багатьох
      (у одному чатику багато людей, у однієї людини може бато різних чатів)
      (в одному замовленні багато товарів, один товар може бути в багатьох замовленнях)
  По обов'язковковості сутності (по жорсткості)
    Жорсткі ( 1 ) - запис обов'язково пов'язана з записом з іншої таблиці
      ()
    Нежорсткі ( 0 ) - запис необов'язково пов'язана з записом з іншої таблиці

  По кількості таблиць (сутностей у зв'язку)
    - унарні (таблиця посилається на саму себе)
    - бінарні (дві таблиці)
    - тернарні
    - ...
*/
