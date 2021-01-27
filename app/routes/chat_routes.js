/**
 * Chat Routes
 */

module.exports = function (app) {
    // Import the chat controller
    var chat = require('../controllers/chat');

    // Send a message
    app.route('/chat/send_msg')
        .post(chat.send_msg);

    // Get all user messages
    app.route('/chat/:user_id')
        .get(chat.get_all_user_msgs);

    // Get user chat history
    app.route('/chat/history/:from_user_id/:to_user_id')
        .get(chat.get_chat_history);

    // Get chatroom history
    app.route('/chat/room/history/:chatroom_id')
        .get(chat.get_chat_room_history);

    // TO DO - filter by user
    // Get user contacts
    app.route('/chat/friends/:user_id')
        .get(chat.get_user_friends);

    // Create a chatroom
    app.route('/chat/rooms/new')
        .post(chat.new_chat_room);

    // Add a user to a chatroom
    app.route('/chat/rooms/add_user')
        .put(chat.add_user_to_chat_room);

    // Get user chatroom id
    app.route('/chat/rooms/id/:chatroom_name')
        .get(chat.get_user_chat_room_id);

    // send chatroom message
    app.route('/chat/rooms/message')
        .post(chat.send_chat_room_message);

    // Get user chatrooms
    app.route('/chat/rooms/user/:user_id')
        .get(chat.get_user_chat_rooms);

    // Get chatroom messages
    app.route('/chat/rooms/messages/:user_id')
        .get(chat.get_user_chat_room_messages);

    // Get checked in chat rooms ids
    app.route('/chat/rooms')
        .get(chat.get_chat_rooms);

    // Check if other users are checkedin at a venue
    app.route('/chat/rooms/users/checkedin/:chatroom_id')
        .get(chat.get_users_checkedin);

    // Get all chat room coordinates
    app.route('/chat/rooms/all/coordinates')
        .get(chat.get_all_chat_room_coordinates);

    // Mark a message as read
    app.route('/chat/read')
        .put(chat.mark_read_unread);

    // Delete a message
    app.route('/chat/delete')
        .delete(chat.delete_msg);

};