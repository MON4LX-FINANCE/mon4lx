/**
 * Database Configuration
 */

var mysql = require('mysql');
var fs     = require('fs');

//mysql db connection
var connection = mysql.createPool({
    connectionLimit: 5, //important
    host: 'localhost',
    user: 'root',
    password: 'e60CeL5syAuPD5KM',
    database: 'mon4lx',
    debug: false,
    ssl      : {
        ca   : fs.readFileSync('./ssl/server-ca.pem'), // should be enough for AWS
        key  : fs.readFileSync('./ssl/client-key.pem'), // required for google mysql cloud db
        cert : fs.readFileSync('./ssl/client-cert.pem'), // required for google mysql cloud db
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