const mysql = require('mysql2');
const { faker } = require('@faker-js/faker');
const { random } = require("./utils");

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

const users = [];

for (let i = 0; i < 200; i++) {
    const gender = random(0, 1) === 0 ? "male" : "female";
    users.push([
        faker.name.firstName(gender),
        faker.name.lastName(),
        faker.internet.userName(),
        random(18, 120),
        gender,
        faker.date.past(100),
        faker.internet.email(),
        faker.datatype.boolean(),
        faker.internet.password(6)
    ]);
}
const query = "INSERT INTO users(first_name, last_name, username, age, gender, birthday, email, is_premium, password) VALUES ?";

connection.query(
    query,
    [users],
    function (err, result) {
        if (err) throw err;
        console.log(result);
    }
);

connection.end(console.log);