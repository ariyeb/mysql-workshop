-- BOOLEAN
SELECT
  TRUE;
SELECT
  FALSE;
SELECT
  FALSE IS NOT TRUE;
-- -------------------
  -- VARCHAR(255)
SELECT
  LENGTH("shalom olam");
SELECT
  CONCAT("shalom", " ", "olam");
SELECT
  CONCAT_WS("-", "shalom", "olam", "!");
SELECT
  REPLACE("shalom world world", "world", "olam");
-- ---------------------
  -- INT
  -- DECIMAL(P,D)
  -- ENUM("male", "female")
  -- -------------------
  -- TIME hh:mm:ss
SELECT
  CURRENT_TIME();
SELECT
  UTC_TIME();
SELECT
  ADDTIME(CURRENT_TIME(), "01:05:00");
SELECT
  SUBTIME(CURRENT_TIME(), "01:05:00");
SELECT
  TIMEDIFF(ADDTIME(CURRENT_TIME(), "01:05:00"), CURTIME());
-- ------------------
  -- DATE yyyy-mm-dd
SELECT
  CURRENT_DATE();
SELECT
  '2015-01-01' AS start,
  DATE_ADD('2015-01-01', INTERVAL 1 DAY) AS 'one day later',
  DATE_ADD('2015-01-01', INTERVAL 1 WEEK) AS 'one week later',
  DATE_ADD('2015-01-01', INTERVAL 1 MONTH) AS 'one month later',
  DATE_ADD('2015-01-01', INTERVAL 1 YEAR) AS 'one year later';
SELECT
  '2015-01-01' AS start,
  DATE_SUB('2015-01-01', INTERVAL 1 DAY) AS 'one day before',
  DATE_SUB('2015-01-01', INTERVAL 1 WEEK) AS 'one week before',
  DATE_SUB('2015-01-01', INTERVAL 1 MONTH) AS 'one month before',
  DATE_SUB('2015-01-01', INTERVAL 1 YEAR) AS 'one year before';
SELECT
  DAY(CURRENT_DATE()) AS day,
  MONTH(CURRENT_DATE()) AS month,
  QUARTER(CURRENT_DATE()) AS quarter,
  YEAR(CURRENT_DATE()) AS year;
SELECT
  DATEDIFF(CURRENT_DATE(), "1986-01-28");
SELECT
  UTC_DATE();
-- --------------------
  -- DATETIME yyyy-mm-dd hh:mm:ss
SELECT
  NOW();
SELECT
  DATE_FORMAT(NOW(), "%H:%i:%s - %M %D, %Y");
-- DATE_ADD DATE_SUB DATE_DIFF
  -- --------------------------
  -- TIMESTAMP yyyy-mm-dd hh:mm:ss '1970-01-01 00:00:01' UTC to ' 1-19 03:14:07'
  -- ---------------------
  -- NULL
SELECT
  1 IS NULL,
  0 IS NULL,
  NULL IS NULL;
SELECT
  IFNULL(NULL, "some value");