SELECT
  DATABASE();
SHOW TABLES;
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) DEFAULT "ploni",
    username VARCHAR(255) NOT NULL UNIQUE,
    age INT NOT NULL CHECK(age >= 18),
    password VARCHAR(255) NOT NULL CHECK(password != "1234")
  );
INSERT INTO
  users(name, username, age, password)
VALUES
  ("moshe", "moshe3", 32, "12345");
INSERT INTO
  users(username, password)
VALUES
  ("moshe4", "12345");
SELECT
  *
FROM
  users;
DESC users;
DROP TABLE users;