/**
 * Load all Routes
 */

const userRoutes = require('./routes/user_routes');
const chatRoutes = require('./routes/chat_routes');

module.exports = function (app) {
    userRoutes(app);
    chatRoutes(app);
}