CREATE TABLE manufacturers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
);
INSERT INTO
  manufacturers(name)
VALUES
  ("dell"),
  ("asus"),
  ("lenovo"),
  ("hp"),
  ("microsoft"),
  ("apple"),
  ("sumsung"),
  ("moshe");
SELECT
  *
FROM
  manufacturers;
CREATE TABLE computers(
    model VARCHAR(255),
    manufacturer_id INT
  );
INSERT INTO
  computers(model, manufacturer_id)
VALUES
  ("x1", 1),("x2", 2),("x3", 3),("x4", 4),("x5", 5),("x6", 6),("x7", NULL);
SELECT
  *
FROM
  computers;
--   INNER JOIN
SELECT
  computers.model,
  manufacturers.name
FROM
  computers
  INNER JOIN manufacturers ON computers.manufacturer_id = manufacturers.id;
--   LEFT JOIN
SELECT
  computers.model,
  manufacturers.name
FROM
  computers
  LEFT JOIN manufacturers ON computers.manufacturer_id = manufacturers.id;
--   RIGHT JOIN
SELECT
  computers.model,
  manufacturers.name
FROM
  computers
  RIGHT JOIN manufacturers ON computers.manufacturer_id = manufacturers.id;
--   FULL OUTER JOIN -- UNION
  (
    SELECT
      computers.model,
      manufacturers.name
    FROM
      computers
      LEFT JOIN manufacturers ON computers.manufacturer_id = manufacturers.id
  )
UNION
  (
    SELECT
      computers.model,
      manufacturers.name
    FROM
      computers
      RIGHT JOIN manufacturers ON computers.manufacturer_id = manufacturers.id
  );
--   CROSS JOIN
SELECT
  computers.model,
  manufacturers.name
FROM
  computers
  CROSS JOIN manufacturers
ORDER BY
  computers.model;
CREATE TABLE persons (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) DEFAULT "ploni",
    last_name VARCHAR(255) DEFAULT "almoni",
    gender ENUM('male', 'female') NOT NULL,
    birthday DATE NOT NULL
  );
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL CHECK (password != "1234"),
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE
  );
SELECT
  *
FROM
  persons;
SELECT
  *
FROM
  users;
INSERT INTO
  users (person_id, username, email, password)
VALUES
  (700, "moshe1", "moshe@moshe.com", "ghfyugfuyg");
DELETE FROM
  persons
WHERE
  persons.id = 450;
SELECT
  users.id,
  users.person_id
FROM
  users
WHERE
  users.person_id = 2;
DELETE FROM
  users
WHERE
  users.id = 47;
DELETE FROM
  persons
WHERE
  persons.id = 1;
-- DELETE JOIN
  DELETE persons,
  users
FROM
  persons
  JOIN users ON users.person_id = persons.id
WHERE
  users.id = 342;
--   DELETE CASCADE
  DROP TABLE persons;
DROP TABLE users;
DELETE FROM
  persons
WHERE
  persons.id = 2;
--   שם מלא, יוזר ניים, אימייל
SELECT
  CONCAT(persons.first_name, " ", persons.last_name) AS full_name,
  users.username,
  users.email
FROM
  persons
  JOIN users ON persons.id = users.person_id
ORDER BY
  full_name;
-- בטבלה יוצגו כל האנשים שאין להם יוזר
SELECT
  CONCAT(persons.first_name, " ", persons.last_name) AS full_name
FROM
  persons
  LEFT JOIN users ON persons.id = users.person_id
WHERE
  person_id IS NULL;
--   OUTER JOIN
SELECT
  model,
  name
FROM
  (
    (
      SELECT
        computers.model,
        manufacturers.name
      FROM
        computers
        LEFT JOIN manufacturers ON computers.manufacturer_id = manufacturers.id
    )
    UNION
      (
        SELECT
          computers.model,
          manufacturers.name
        FROM
          computers
          RIGHT JOIN manufacturers ON computers.manufacturer_id = manufacturers.id
      )
  ) AS computers_manufacturers
WHERE
  model IS NULL
  OR name IS NULL;