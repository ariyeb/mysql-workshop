SELECT
  *
FROM
  users;
SELECT
  MAX(users.age),
  MIN(users.age),
  AVG(users.age),
  COUNT(users.id),
  SUM(users.age)
FROM
  users;
SELECT
  GROUP_CONCAT(
    DISTINCT users.username
    ORDER BY
      users.username SEPARATOR ";"
  )
FROM
  users;
SELECT
  DATABASE();
DROP Table users;
CREATE TABLE workers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) DEFAULT "ploni",
    last_name VARCHAR(255) DEFAULT "almoni",
    age INT NOT NULL,
    gender ENUM('male', 'female') NOT NULL,
    height INT NOT NULL,
    country VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    favorite_color VARCHAR(255) NOT NULL,
    job VARCHAR(255) NOT NULL,
    salary INT NOT NULL,
    beginning_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
  );
SELECT
  workers.gender,
  workers.salary
FROM
  workers;
SELECT
  workers.gender,
  AVG(workers.salary)
FROM
  workers
GROUP BY
  workers.gender;
SELECT
  workers.country,
  workers.gender,
  AVG(workers.salary)
FROM
  workers
GROUP BY
  workers.country,
  workers.gender
ORDER BY
  workers.country;
-- HAVING
SELECT
  workers.favorite_color,
  workers.gender,
  COUNT(workers.id)
FROM
  workers
GROUP BY
  workers.favorite_color,
  workers.gender
HAVING
  workers.favorite_color = "orange";
-- 1) מצאו את שכבת הגיל שהמשכורת הממוצעת בה הכי גבוהה
SELECT
  workers.age,
  AVG(workers.salary) AS avg_salary
FROM
  workers
GROUP BY
  workers.age
ORDER BY
  avg_salary DESC
LIMIT
  5;
-- 2 מצאו את השכר הממוצע של נשים וגברים בגילאי 25-30 לפי חלוקה לגילאים ומגדר
SELECT
  workers.age,
  workers.gender,
  AVG(workers.salary)
FROM
  workers
GROUP BY
  workers.age,
  workers.gender
HAVING
  workers.age BETWEEN 25
  AND 30
ORDER BY
  workers.age;
SELECT
  workers.age,
  workers.gender,
  AVG(workers.salary)
FROM
  workers
WHERE
  workers.age BETWEEN 25
  AND 30
GROUP BY
  workers.age,
  workers.gender
ORDER BY
  workers.age;
-- הציגו את כל העבודות שיש בהם יותר עובדים בני 50 ויותר מצעירים מ50
SELECT
  workers.job,
  SUM(IF(workers.age >= 50, 1, 0)) AS above,
  SUM(IF(workers.age < 50, 1, 0)) AS under
FROM
  workers
GROUP BY
  workers.job
HAVING
  above > under
ORDER BY
  workers.job;
-- SUB QUERY
SELECT
  job
FROM
  (
    SELECT
      workers.job,
      SUM(IF(workers.age >= 50, 1, 0)) AS above,
      SUM(IF(workers.age < 50, 1, 0)) AS under
    FROM
      workers
    GROUP BY
      workers.job
    HAVING
      above > under
    ORDER BY
      workers.job
  ) AS jobs_by_age;
-- מצאו את המקצועות שממוצע השכר של הנשים גבוה ממוצע השכר של הגברים
SELECT
  workers.job,
  AVG(
    IF(workers.gender = "male", workers.salary, NULL)
  ) AS male_avg_salary,
  AVG(
    IF(workers.gender = "female", workers.salary, NULL)
  ) AS female_avg_salary
FROM
  workers
GROUP BY
  workers.job
HAVING
  female_avg_salary > male_avg_salary
ORDER BY
  workers.job;
-- מהו שירות האימייל הכי נפוץ בכל מקצוע
SELECT
  job,
  CASE
    WHEN (
      gmail > hotmail
      AND gmail > yahoo
    ) THEN "gmail"
    WHEN (
      gmail < hotmail
      AND hotmail > yahoo
    ) THEN "hotmail"
    ELSE "yahoo"
  END
FROM
  (
    SELECT
      workers.job,
      SUM(IF(workers.email LIKE "%@gmail.com", 1, 0)) AS gmail,
      SUM(IF(workers.email LIKE "%@yahoo.com", 1, 0)) AS yahoo,
      SUM(IF(workers.email LIKE "%@hotmail.com", 1, 0)) AS hotmail
    FROM
      workers
    GROUP BY
      workers.job
  ) AS emails_count_by_job;