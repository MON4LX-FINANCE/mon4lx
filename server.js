/**
 * Main Server file
 */

// Dependencies
const fileupload = require('express-fileupload');
// Initialise the app as express
const express = require('express'),
    app = express(),
    bodyParser = require('body-parser'),
    port = process.env.PORT || 443;

// Enable JSON body parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(fileupload());

// Import and register routes
const routes = require('./app/index.js');
routes(app);

// Start the server
app.listen(port, () => { console.log('API server started on port ' + port); });
