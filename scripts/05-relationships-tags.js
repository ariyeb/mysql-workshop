const mysql = require('mysql2');
const { faker } = require('@faker-js/faker');
const { getTagsArray, getPhotoTags } = require("./utils");

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

const tags = getTagsArray().map(tag => [tag]);
const tagsQuery = "INSERT INTO tags(tag) VALUES ?";

connection.query(
    tagsQuery,
    [tags],
    function (err, result) {
        if (err) throw err;
        console.log(result);
    }
);

const photoTags = [];
for (let photoId = 1; photoId <= 650; photoId++) {
    const tags = getPhotoTags();
    if (tags == null) continue;
    tags.forEach(tag => photoTags.push([photoId, tag]));
}


connection.end(console.log);
