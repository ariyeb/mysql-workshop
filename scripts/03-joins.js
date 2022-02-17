const mysql = require('mysql2');
const { faker } = require('@faker-js/faker');
const { random, getUniqueRandomNumber } = require("./utils");

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

const persons = [];
for (let i = 0; i < 600; i++) {
    const gender = random(0, 1) === 0 ? "male" : "female";
    persons.push([
        faker.name.firstName(gender),
        faker.name.lastName(),
        gender,
        faker.date.past(100)
    ]);
}
const personsQuery = "INSERT INTO persons(first_name, last_name, gender, birthday) VALUES ?";

connection.query(
    personsQuery,
    [persons],
    function (err, result) {
        if (err) throw err;
        console.log(result);
    }
);

const users = [];
const personsIdsSet = new Set();
for (let i = 0; i < 450; i++) {
    users.push([
        getUniqueRandomNumber(1, 600, personsIdsSet),
        faker.internet.userName(),
        faker.internet.email(),
        faker.internet.password(6)
    ]);
}
const usersQuery = "INSERT INTO users (person_id, username, email, password) VALUES ?";


connection.query(
    usersQuery,
    [users],
    function (err, result) {
        if (err) throw err;
        console.log(result);
    }
);

connection.end(console.log);
