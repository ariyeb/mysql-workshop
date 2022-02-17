const mysql = require('mysql2');
const { getPhotoTags } = require("./utils");

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

const photoTags = [];
for (let photoId = 1; photoId <= 650; photoId++) {
    const tags = getPhotoTags();
    if (tags == null) continue;
    tags.forEach(tag => photoTags.push([photoId, tag]));
}
const photoTagsQuery = "INSERT INTO photo_tags(photo_id, tag_id) VALUES ?";

connection.query(
    photoTagsQuery,
    [photoTags],
    function (err, result) {
        if (err) throw err;
        console.log(result);
    }
);

connection.end(console.log);
