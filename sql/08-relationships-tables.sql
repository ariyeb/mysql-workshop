CREATE TABLE photos(
  id INT NOT NULL AUTO_INCREMENT PRIMARY key,
  image_url VARCHAR(255) NOT NULL,
  user_id INT NOT null,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
SELECT
  *
FROM
  photos;
SELECT
  users.username,
  COUNT(photos.id)
FROM
  users
  JOIN photos ON users.id = photos.user_id
GROUP BY
  users.id;
CREATE TABLE tags (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tag VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
  );
SELECT
  *
FROM
  tags;
CREATE TABLE photos_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY(photo_id, tag_id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
  );
SELECT
  *
FROM
  photos_tags
ORDER BY
  tag_id;
CREATE TABLE likes(
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (user_id, photo_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
  );
SELECT
  *
FROM
  likes
ORDER BY
  photo_id;