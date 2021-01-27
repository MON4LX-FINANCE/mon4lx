/**
 * Database Configuration
 */

var mysql = require('mysql');

//mysql db connection
var connection = mysql.createPool({
    connectionLimit: 5, //important
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'mon4lx',
    debug: false
});

connection.getConnection(function (err) {
    if (err) {
        console.log("Error connecting to database", err);
    } else {
        console.log("Database is connected");
    }
});

module.exports = connection;