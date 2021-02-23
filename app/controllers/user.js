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

  if (req.query.email && req.query.password) {

    User.userLogin(req.query, function (err, res) {

      if (err) {
        _res.send(err);
      } else {
        _res.send(res);
      }
    });
  } else {
    _res.sendStatus(400);
  }
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

// Get user email by id
exports.get_email_by_id = function (req, res) {

  User.getEmailById(req.params.id, function (err, id) {

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
  User.getUserById(req.params.id, function (err, user) {

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

  // console.log('controller body',req.body)
  // console.log('controller params',req.params)

  User.updateUserById(req.params.id, req.body, function (err, res) {
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
