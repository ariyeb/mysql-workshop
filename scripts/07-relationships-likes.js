const mysql = require('mysql2');
const { faker } = require('@faker-js/faker');
const { getUserLikes } = require("./utils");

const connection = mysql.createConnection({
    host: 'localhost',
    port: 4000,
    user: 'root',
    password: 'root321',
    database: 'db_example'
});

connection.connect((err) => {
    if (err) console.log(err);
    console.log('connected as id ' + connection.threadId);
});

const likes = [];
for (let userId = 1; userId <= 450; userId++) {
    const userLikes = getUserLikes();
    if (userLikes == null) continue;
    userLikes.forEach(like => likes.push([userId, like, faker.date.past(1)]));
}
const likesQuery = "INSERT INTO likes(user_id, photo_id, created_at) VALUES ?";

connection.query(
    likesQuery,
    [likes],
    function (err, result) {
        if (err) throw err;
        console.log(result);
    }
);

connection.end(console.log);
