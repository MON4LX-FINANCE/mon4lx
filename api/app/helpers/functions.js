/**
 * Helper Functions
 */

// Dependencies
var crypto = require('crypto');
let hashingSecret = 'knhk0lIjJgKJxENi4XyV9OJjJRtYsA79xLRrcf2qbKOG6Biq';
let jwt = require('jsonwebtoken');

// Container for all the helpers
var helpers = {};

// Create a SHA256 hash
helpers.hash = function (str) {

    if (typeof (str) == 'string' && str.length > 0 && str.length < 256) {
        var hash = crypto.createHmac('sha256', hashingSecret).update(str).digest('hex');
        return hash;
    } else {
        return false;
    }
};

// Create a string of random alphanumeric characters and a given length
helpers.createRandomString = function (strLength) {
    // Verify that the string length is a number greater than zero
    strLength = typeof (strLength) == 'number' && strLength > 0 ? strLength : false;

    if (strLength) {
        // Define all the possible characters that could go into a string
        var possibleCharacters = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

        // Start the final string
        var str = '';
        for (i = 1; i <= strLength; i++) {
            // Get a random character from the possibleCharacters string
            var randomCharacter = possibleCharacters.charAt(Math.floor(Math.random() * possibleCharacters.length));
            // Append this character to the string
            str += randomCharacter;
        }
        // Return the final string
        return str;
    } else {
        // console.log('createRandomString string length error');
        return false;
    }
};

// Create a JSON Web Token
helpers.createToken = function (email) {
    // sign with default (HMAC SHA256)
    let expirationDate = Math.floor(Date.now() / 1000) + 6220800 // seconds from now (3 months)
    var token = jwt.sign({ email: email, exp: expirationDate }, hashingSecret);
    return token;
}

// Verify JSON Web Token
helpers.verifyToken = function (token) {
    let valid = false;

    // Return true if token is valid
    jwt.verify(token, hashingSecret, function (err, decoded) {
        if (err) {
            console.log('error verifying token', err);
            valid = false;
        } else {
            // console.log('decoded token', decoded);
            valid = true;
        }
    });
    return valid;
};


// Export the module
module.exports = helpers;
