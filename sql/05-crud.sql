SELECT
  DATABASE();
-- אנא צרו טבלה שכוללת
  -- איידי, שם_פרטית שם_משפחה, יוזרניים, גיל, מין, יום הולדת, אימייל, האם פרמיום, סיסמה,
  -- זמן שנוצרה וזמן שעודכנה
  CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) DEFAULT "ploni",
    last_name VARCHAR(255) DEFAULT "almoni",
    username VARCHAR(255) NOT NULL UNIQUE,
    age INT NOT NULL CHECK(age >= 18),
    gender ENUM("male", "female"),
    birthday DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    is_premium BOOLEAN NOT NULL,
    password VARCHAR(255) CHECK(password != "1234"),
    created_at TIMESTAMP DEFAULT NOW(),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
  );
DESC users;
SELECT
  *
FROM
  users;
SELECT
  users.id,
  users.username,
  users.age
FROM
  users
LIMIT
  10;
SELECT
  CONCAT(users.first_name, " ", users.last_name) AS full_name
FROM
  users;
SELECT
  users.username,
  users.age
FROM
  users
ORDER BY
  users.age DESC;
SELECT
  users.username,
  users.age
FROM
  users
ORDER BY
  users.username DESC;
SELECT
  users.username,
  users.birthday
FROM
  users
ORDER BY
  users.birthday
LIMIT
  1;
SELECT
  users.last_name,
  users.first_name,
  users.age
FROM
  users
ORDER BY
  users.last_name,
  users.first_name,
  users.age;
-- DISTINCT
SELECT
  DISTINCT users.last_name,
  users.email
FROM
  users
ORDER BY
  users.last_name;
-- IF()
SELECT
  users.username,
  IF(users.is_premium, "PREMIUM", "NOT PREMIUM") AS "PREMIUM"
FROM
  users;
-- CASE
SELECT
  users.username,
  CASE
    WHEN users.age <= 25 THEN "young"
    WHEN users.age <= 35 THEN "adult"
    ELSE "one foot in the grave"
  END AS age_group
FROM
  users;
-- WHERE
SELECT
  users.username,
  users.age
FROM
  users
WHERE
  users.age > 40
ORDER BY
  users.age;
SELECT
  users.username,
  users.age
FROM
  users
WHERE
  users.age >= 40
  AND users.age <= 80 -- && OR ||
ORDER BY
  users.age;
SELECT
  users.username,
  users.age
FROM
  users
WHERE
  users.age BETWEEN 40
  AND 80
ORDER BY
  users.age;
SELECT
  users.username
FROM
  users
WHERE
  users.age BETWEEN 40
  AND 80
ORDER BY
  users.age;
--   = != <> < > <= >=
  -- IS TRUE IS NOT TRUE
  -- IS NULL IS NOT NULL
SELECT
  users.username
FROM
  users
WHERE
  users.username <> "Dolly14";
-- LIKE
SELECT
  users.username
FROM
  users
WHERE
  users.username LIKE "_a%";
--   בנו טבלה מתוך היוזרים שיש בה עמודה של יוזרניים וספק אימייל
SELECT
  users.username,
  CASE
    WHEN users.email LIKE "%@gmail.com" THEN "gmail"
    WHEN users.email LIKE "%@hotmail.com" THEN "hotmail"
    ELSE "yahoo"
  END AS email_provider
FROM
  users
ORDER BY
  email_provider;
-- IN()
SELECT
  users.username
FROM
  users
WHERE
  users.username IN("Tanner45", "Zetta70", "Jaiden9");
--
SET
  @age = 25,
  @is_premium = NULL,
  @gender = "male" COLLATE utf8mb4_0900_ai_ci;
SELECT
  @age;
SELECT
  users.username,
  users.age,
  users.gender,
  users.is_premium
FROM
  users
WHERE
  (
    users.age = @age
    OR @age IS NULL
  )
  AND (
    users.is_premium = @is_premium
    OR @is_premium IS NULL
  )
  AND (
    users.gender = @gender
    OR @gender IS NULL
  );
--  UPDATE
SELECT
  users.username,
  users.age,
  users.gender
FROM
  users
WHERE
  users.age = 46;
UPDATE
  users
SET
  users.age = users.age + 1,
  users.username = CONCAT(users.username, "-46")
WHERE
  users.age = 45;
SELECT
  *
FROM
  users
WHERE
  users.email LIKE "%@yahoo.com";
UPDATE
  users
SET
  users.email = REPLACE(users.email, "yahoo", "gmail")
WHERE
  users.email LIKE "%@yahoo.com";
--   DELETE
SELECT
  users.username
FROM
  users
WHERE
  users.username LIKE "c%";
DELETE FROM
  users
WHERE
  users.username LIKE "c%";
SELECT
  users.id,
  users.username,
  users.created_at
FROM
  users
ORDER BY
  users.id DESC
LIMIT
  5;
DELETE FROM
  users
ORDER BY
  users.id DESC
LIMIT
  5;