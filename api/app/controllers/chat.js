/**
 * Chat Controller
 */

var Chat = require('../models/chat_model.js');

// Send a message
exports.send_msg = function (req, _res) {

    // console.log('send a message controller', req.body)

    //handles null error 
    if (!req.body) {

        _res.status(400).send({ error: true, message: 'Missing required fields' });

    } else {

        Chat.sendMsg(req.body, function (err, res) {

            if (err)
                _res.send(err);
            else
                _res.json(res);

        });
    }
};

// Get user chat history
exports.get_chat_history = function (req, _res) {

    // console.log('get chat history controller', req.params)

    Chat.getChatHistory(req.params.from_user_id, req.params.to_user_id, function (err, res) {

        if (err)
            res.send(err);
        else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Get chat room history
exports.get_chat_room_history = function (req, _res) {

    // console.log('get chatroom history controller', req.params)

    Chat.getChatRoomHistory(req.params.chatroom_id, function (err, res) {

        if (err)
            res.send(err);
        else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }
    });
};

// Mark a message as read or unread
exports.mark_read_unread = function (req, _res) {

    // console.log('mark message as read or unread controller', req.body)

    Chat.markReadUnread(req.body.read, req.body.user_id, req.body.message_id, function (err, res) {
        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.send(resultJson);
        }
    });
};

// Get all user messages
exports.get_all_user_msgs = function (req, _res) {

    Chat.getAllUserMgs(req.params.user_id, function (err, res) {

        if (err)
            res.send(err);
        else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Delete a message
exports.delete_msg = function (req, res) {

    // console.log('delete a message controller', req.body)

    Chat.deleteMsg(req.body.user_id, req.body.message_id, function (err) {
        if (err)
            res.send(err);
        else
            res.json({ message: 'Message deleted successfully!' });
    });
};

// Get user's friends
exports.get_user_friends = function (req, _res) {

    // console.log('get user friends controller', req.params)

    Chat.getUserFriends(req.params.user_id, function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Create a chatroom
exports.new_chat_room = function (req, _res) {

    Chat.newChatRoom(req.body, function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Add a user to a chatroom
exports.add_user_to_chat_room = function (req, _res) {

    Chat.isUserInChatRoom(req.body.from_user_id, req.body.chatroom_id, function (err, res) {
        if (err) {
            _res.send(err);
        } else {
            // console.log('add user to chatroom', res[0]);

            if (res[0].user_id == req.body.from_user_id) {
                _res.status(200).send({ error: false, message: 'User already in chatroom' });
            } else {
                Chat.addUserToChatRoom(req.body.from_user_id, req.body.chatroom_id, function (err, res) {

                    if (err) {
                        _res.send(err);
                    } else {
                        var resultJson = JSON.parse(JSON.stringify(res))
                        _res.json(resultJson);
                    }

                });
            }
        }
    });
};

// Get user chat room id
exports.get_user_chat_room_id = function (req, _res) {

    // console.log('get chatromm id controller', req.params.chatroom_name)

    Chat.getUserChatRoomId(req.params.chatroom_name, function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Get user chat rooms
exports.get_user_chat_rooms = function (req, _res) {

    Chat.getUserChatRooms(req.params.user_id, function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            _res.send(res);
        }
    });
};

// Send chat room message
exports.send_chat_room_message = function (req, _res) {

    // console.log('send chatroom message controller', req.body)

    Chat.sendChatRoomMessage(req.body, function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Get user chat room messages
exports.get_user_chat_room_messages = function (req, _res) {

    // console.log('get user chatroom messages controller', req.params)

    Chat.getUserChatRoomMessages(req.params.user_id, function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Get chat room ids of users checked in
exports.get_chat_rooms = function (req, _res) {

    // console.log('get chatrooms controller', req)

    Chat.getChatRoomIds(function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Get users checked in at a venue
exports.get_users_checkedin = function (req, _res) {

    // console.log('get users checked in controller', req.params)

    Chat.getUsersCheckedIn(req.params.chatroom_id, function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }

    });
};

// Get all chat room coordinates
exports.get_all_chat_room_coordinates = function (req, _res) {

    // console.log('get chatroom coordinates controller')

    Chat.getAllChatRoomCoordinates(function (err, res) {

        if (err) {
            _res.send(err);
        } else {
            var resultJson = JSON.parse(JSON.stringify(res))
            _res.json(resultJson);
        }
    });
};