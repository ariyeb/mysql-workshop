const mysql = require('mysql2');
const { faker } = require('@faker-js/faker');
const { generateSetOf100UsersIds, getRandomNumberThatDontExistInASet } = require("./utils");

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

const photos = [];
const inactiveUsers = generateSetOf100UsersIds();
for (let i = 0; i < 650; i++) {
    photos.push([
        "https://picsum.photos/400/600",
        getRandomNumberThatDontExistInASet(1, 450, inactiveUsers),
    ]);
}
const photosQuery = "INSERT INTO photos(image_url, user_id) VALUES ?";

connection.query(
    photosQuery,
    [photos],
    function (err, result) {
        if (err) throw err;
        console.log(result);
    }
);

connection.end(console.log);
