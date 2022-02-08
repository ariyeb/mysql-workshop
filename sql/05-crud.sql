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