/**
 * User Routes
 */

module.exports = function (app) {
    // Import the user controller
    var users = require('../controllers/user');

    // Get and create user
    app.route('/users')
        .get(users.get_all_users)
        .post(users.create_user);

    // Get, update, delete user by id
    app.route('/users/id/:user_id')
        .get(users.get_user)
        .put(users.update_user)
        .delete(users.delete_user);

    // Get user's email by id
    app.route('/users/email/:email')
        .get(users.get_email_by_id);

    // Login
    app.route('/users/login')
        .get(users.user_login);

    // Get user token by email
    app.route('/users/token/:email')
        .get(users.get_token_by_email);

};