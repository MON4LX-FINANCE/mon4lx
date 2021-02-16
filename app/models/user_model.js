/**
 * User Model
 */

var con = require('../config/db');
var helpers = require('../helpers/functions');

var admin = require("firebase-admin");
var serviceAccount = require("../../rising-pen-293118-firebase-adminsdk-t7erb-652b72600c.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  // databaseURL: 'https://<DATABASE_NAME>.firebaseio.com'
});



//User functions container
var User = {};

// Create user
// Required fields: email, password, username, phone, pin
// Optional fields: location, firstname, lastname, othernames, businessname
User.createUser = function (newUser, result) {

  // Hash the password
  let hashedPassword = helpers.hash(newUser.password);
  newUser.password = hashedPassword;
  // Generate a token for the user
  var token = helpers.createToken(newUser.email);
  // Add token to the user data object
  newUser.token = token;

  // console.log('user', newUser);

  if (newUser.email && newUser.username && newUser.phone && newUser.pin && newUser.password) {
    con.query("INSERT INTO users SET ?", newUser, function (err, res) {

      if (err) {
        result(err, null);
      } else {
        con.query("SELECT * FROM users WHERE userId = ?", res.insertId, function (_err, _res) {
          if (_err)
            result(_err, null);
          else
            result(null, _res);
        }
        );
      }
    });
  } else {
    result({ "Create user error": "Missing required fields" }, null);
  }
};

// Get token by email
// Required field: email
// Optional fields: none
User.getTokenByEmail = function (email) {

  // If email is not null, proceed
  if (email) {

    con.query("SELECT token FROM users WHERE email = ? ", email, function (err, res) {

      if (err) {
        // console.log('user model - get token error', err);
        return err;
      } else {
        let response = res[0].token;
        // console.log('user model - get token response', response);
        return response;
      }
    });
  } else {
    let error = "Get token by email error: Missing required field email";
    // console.log(error);
    return error;
  }
};

// Get user by id
// Required field: user_id
// Optional fields: none
User.getUserById = function (userId, result) {
  if (userId) {
    con.query("SELECT * FROM users WHERE userId = ? ", userId, function (err, res) {
      if (err) {
        result(err, null);
      } else {
        result(null, res);
      }
    });
  } else {
    result({ "Get user by id error": "Missing required field user_id" }, null);
  }
};

// Get id by email
// Required field: email
// Optional fields: none
User.getIdByEmail = function (email, result) {
  if (email) {
    con.query("SELECT userId FROM users WHERE email = ? ", email, function (err, res) {
      if (err) {
        result(err, null);
      } else {
        result(null, res);
      }
    });
  } else {
    result({ "Get id by email error": "Missing required field email" }, null);
  }
};

// Get email by id
// Required field: id
// Optional fields: none
User.getEmailById = function (id, result) {
  if (id) {
    con.query("SELECT email FROM users WHERE userId = ? ", id, function (err, res) {
      if (err) {
        result(err, null);
      } else {
        result(null, res);
      }
    });
  } else {
    result({ "Get email by id error": "Missing required field id" }, null);
  }
};

// Save access token
// Required field: email
// Optional fields: none
User.updateToken = function (params, result) {

  let email = params[0].email;
  let token = helpers.createToken(email);

  if (email) {
    con.query("UPDATE users SET token = ? WHERE email = ?", [
      token, email
    ], function (err, res) {
      if (err)
        result(err, null);
      else
        result(null, res);
    });
  } else {
    result({ "Update user token error": "Missing required fields" }, null);
  }
}

// User Login
// Required field: email, password
// Optional fields: none
User.userLogin = function (params, result) {

  var _password = params.password;
  var _email = params.email;
  var _token = params.token;

  // Hash user password
  var _hashedPassword = helpers.hash(_password);

  if (_email && _hashedPassword && _token) {

    con.query("SELECT password FROM users WHERE email = ?", _email, function (err, res) {

      if (err) {
        result(err, null);
      } else {
        // var resJson = JSON.parse(JSON.stringify(res[0]));

        // Check if password is valid
        if (_hashedPassword === res[0].password) {

          con.query("SELECT * FROM users WHERE email = ? && password = ?", [_email, _hashedPassword], function (_err, _res) {

            if (_err) {
              result(_err, null);
            } else {
              result(null, _res);
            }
          });
        } else {
          result(401, { "Error": "Authentication error" });
        }
      }
    });
  } else {
    // console.log("User login error: Missing required field(s)")
    result(400, { "Login error": "Missing required field(s)" });
  }
};

// Get all users
User.getAllUsers = function (result) {
  con.query("SELECT * FROM users", function (err, res) {

    if (err) {
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

// Update user helper function
let update = function (col, value, id, result) {

  con.query("UPDATE users SET " + col + " = ? WHERE userId = ?", [
    value, id
  ], function (err, res) {
    if (err) {
      result(err, null);
    } else {
      // Get the updated user data
      con.query("SELECT * FROM users WHERE userId = ?", id, function (_err, _res) {
        if (err) {
          // console.log('update helper function error', _err)
          result(err, null);
        } else {
          // console.log('update helper function response', _res)
          result(null, _res[0]);
        }
      })
    }
  });

}

// Update user by id
// Required fields: user_id
// Optional fields: email, password, address_1, address_2, phone, country
User.updateUserById = function (id, body, result) {

  if (body.email) {
    update('email', body.email, id, result)
  }
  if (body.password) {
    update('password', body.password, id, result)
  }
  if (body.location) {
    update('location', body.location, id, result)
  }
  if (body.othernames) {
    update('othernames', body.othernames, id, result)
  }
  if (body.phone) {
    update('phone', body.phone, id, result)
  }
  if (body.businessname) {
    update('businessname', body.businessname, id, result)
  }
  if (body.username) {
    update('username', body.username, id, result)
  }
  if (body.firstname) {
    update('firstname', body.firstname, id, result)
  }
  if (body.lastname) {
    update('lastname', body.lastname, id, result)
  }
  if (body.pin) {
    update('pin', body.pin, id, result)
  }
};

// Delete user(s)
User.remove = function (id, result) {
  con.query("DELETE FROM users WHERE userId = ?", [id], function (err, res) {

    if (err) {
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

module.exports = User;