SELECT
  DATABASE();
USE db_example;
CREATE TABLE persons(name VARCHAR(40), age INT);
SHOW TABLES;
DESC persons;
DROP TABLE persons;
INSERT INTO
  persons(name, age)
VALUES
  ("moshiko", 25),
  ("moshit", 54);
SELECT * FROM persons;
TRUNCATE TABLE persons;