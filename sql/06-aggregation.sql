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