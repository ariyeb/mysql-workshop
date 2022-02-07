const mysql = require('mysql2');
const { faker } = require('@faker-js/faker');
const { random, getRandomJob, getRandomSalary } = require("./utils");

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

const data = [];

for (let i = 0; i < 500; i++) {
    const gender = random(0, 1) === 0 ? "male" : "female";
    data.push([
        faker.name.firstName(gender),
        faker.name.lastName(),
        random(18, 120),
        gender,
        random(160, 200),
        faker.address.country(),
        faker.date.past(100),
        faker.internet.email(),
        faker.commerce.color(),
        getRandomJob(),
        getRandomSalary(),
        faker.date.past(10)
    ]);
}
const query = "INSERT INTO workers(first_name, last_name, age, gender, height, country, birthday, email, favorite_color, job, salary, beginning_date) VALUES ?";

connection.query(
    query,
    [data],
    function (err, result) {
        if (err) throw err;
        console.log(result);
    }
);

connection.end(console.log);