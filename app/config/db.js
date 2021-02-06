/**
 * Database Configuration
 */

var mysql = require('mysql');
var fs = require('fs');

//mysql db connection
var connection = mysql.createPool({
    connectionLimit: 5, //important
    host: '35.246.46.157',
    // socketPath: '/cloudsql/rising-pen-293118:europe-west2:mon4lx-db',
    user: 'root',
    password: 'e60CeL5syAuPD5KM',
    database: 'mon4lx',
    debug: false,
    ssl: {
        ca: fs.readFileSync('./app/ssl/server-ca.pem'), // should be enough for AWS
        key: fs.readFileSync('./app/ssl/client-key.pem'), // required for google mysql cloud db
        cert: fs.readFileSync('./app/ssl/client-cert.pem'), // required for google mysql cloud db
    }
});

connection.getConnection(function (err) {
    if (err) {
        console.log("Error connecting to database", err);
    } else {
        console.log("Database is connected");
    }
});

module.exports = connection;