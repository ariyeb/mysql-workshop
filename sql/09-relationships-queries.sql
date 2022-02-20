--  מי המשתמשים שלא העלו תמונה אף פעם תמונה
SELECT
  users.username
FROM
  users
  LEFT JOIN photos ON users.id = photos.user_id
WHERE
  photos.user_id IS NULL;
-- מי חמשת היוזרים שנתנו הכי הרבה לייקים
SELECT
  users.username,
  COUNT(likes.photo_id) AS likes_count
FROM
  users
  JOIN likes ON users.id = likes.user_id
GROUP BY
  users.id
ORDER BY
  likes_count DESC
LIMIT
  100;
--   מי המשתמש קיבל הכי הרבה לייקים על תמונה שהעלה
SELECT
  users.username,
  photos.id,
  COUNT(likes.photo_id) AS total_likes
FROM
  users
  JOIN photos ON users.id = photos.user_id
  JOIN likes ON photos.id = likes.photo_id
GROUP BY
  photos.id
ORDER BY
  total_likes DESC
LIMIT
  10;
-- מה התגית הכי פופולרית
SELECT
  tags.tag,
  COUNT(photos_tags.photo_id) AS photos_count
FROM
  tags
  JOIN photos_tags ON tags.id = photos_tags.tag_id
GROUP BY
  tags.id
ORDER BY
  photos_count DESC
LIMIT
  10;
--   כמה תמונות מעלה משתמש בממוצע נכון לעכשיו
SELECT
  (
    SELECT
      COUNT(photos.id)
    FROM
      photos
  ) / (
    SELECT
      COUNT(users.id)
    FROM
      users
  ) AS avg;
-- הציגו את כל התמונות עם כל הפרטים שלהן כולל התגיות של כל תמונה כאשר לכל תמונה יש רק שורה אחת
SELECT
  photos.id,
  photos.image_url,
  photos.user_id,
  photos.created_at,
  GROUP_CONCAT(tags.tag) AS tags
FROM
  photos
  LEFT JOIN photos_tags ON photos.id = photos_tags.photo_id
  JOIN tags ON photos_tags.tag_id = tags.id
GROUP BY
  photos.id;
--   באלו תמונות גברים נתנו יותר לייקים מנשים
SELECT
  photos.id,
  SUM(IF(persons.gender = "male", 1, 0)) AS male_likes,
  SUM(IF(persons.gender = "female", 1, 0)) AS female_likes
FROM
  photos
  JOIN likes ON photos.id = likes.photo_id
  JOIN users ON likes.user_id = users.id
  JOIN persons ON users.person_id = persons.id
GROUP BY
  photos.id
HAVING
  male_likes > female_likes
ORDER BY
  photos.id;