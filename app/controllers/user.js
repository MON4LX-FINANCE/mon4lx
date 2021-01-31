/**
 * User Controller
 */

//  Dependencies
var User = require('../models/user_model.js');

// Create user
exports.create_user = function (req, res) {

  if (!req.body) {

    res.status(400).send({ error: true, message: 'Please provide user details' });

  } else {

    User.createUser(req.body, function (err, user) {

      if (err)
        res.send(err);
      else
        res.json(user);

    }
    );
  }
};

// User Login
exports.user_login = function (req, _res) {

  if (req.query.email && req.query.password && req.query.token) {

    User.userLogin(req.query, function (err, res) {

      if (err) {
        _res.send(err);
      } else {

        User.updateToken(res, function (err_, res_) {

          if (err_) {
            _res.send(err_);
          } else {
            _res.send(res);
          }
        });
      }
    });
  } else {
    _res.sendStatus(400);
  }

  // var _res = res;
  // console.log('\nheaders', req.headers);

  // Get the authorization header from the request
  // let auth = req.headers.authorization;
  // console.log('\nauth', auth);

  // Remove token part from Bearer string
  // let token = auth.substring('Bearer '.length);
  // console.log('\ntoken', token);

  // Get user's access token from database using email
  // let email = req.query.email;
  // con.query("SELECT token FROM users WHERE email = ? ", email, function(err, res) {
  //
  //   if (err) {
  //     console.log('\nget token error', err);
  //   } else {

  // Get the access token from the response
  // let dbToken = res[0].token;
  // console.log('\nget token response', dbToken);

  // If the access token is the same as the one in the database, proceed
  // if (token == dbToken) {

  // Check if token is valid
  // let tokenVerified = helpers.verifyToken(token);
  // console.log('\ntoken verified', tokenVerified);

  // If the token was verified, proceed to try to log user in
  // if (tokenVerified) {
  // Login
  //       } else {
  //         _res.sendStatus(401);
  //       }
  //     } else {
  //       _res.sendStatus(401);
  //     }
  //   }
  // });
};

// Get user id by email
exports.get_user_id = function (req, res) {

  User.getIdByEmail(req.params.email, function (err, id) {

    if (err)
      res.send(err);
    else {
      var resultJson = JSON.parse(JSON.stringify(id))
      res.json(resultJson);
    }
  });
};

// Get user by id
exports.get_user = function (req, res) {
  User.getUserById(req.params.user_id, function (err, user) {

    if (err)
      res.send(err);
    else {
      var resultJson = JSON.parse(JSON.stringify(user))
      res.json(resultJson);
    }

  });
};

// Update user by id
exports.update_user = function (req, res) {

  var _res = res

  User.updateUserById(req.body.user_id, req.body, function (err, res) {
    if (err) {
      _res.send(err);
    } else {
      // console.log('update controller response', res)
      var resultJson = JSON.parse(JSON.stringify(res))
      _res.json(resultJson);
    }
  });
};

// Get user token by email
exports.get_token_by_email = function (req, res) {

  var _res = res

  User.getTokenByEmail(req.body.email, req.body, function (err, res) {
    if (err) {
      _res.send(err);
    } else {
      // console.log('update controller response', res)
      var resultJson = JSON.parse(JSON.stringify(res))
      _res.json(resultJson);
    }
  });
};

// Get all users
exports.get_all_users = function (req, res) {

  User.getAllUsers(function (err, user) {

    if (err)
      res.send(err);
    else {
      var resultJson = JSON.parse(JSON.stringify(user))
      res.json(resultJson);
    }

  });
};

// Delete user
exports.delete_user = function (req, res) {

  User.remove(req.params.user_id, function (err, _res) {
    if (err)
      res.send(err);
    else
      res.json({ message: 'User successfully deleted', response: _res });
  }
  );
};
