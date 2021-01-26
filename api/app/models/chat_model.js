/**
 * Chat Model
 */

var con = require('../config/db');

//Chat object constructor
var Chat = function (msg) {
    this.from_user_id = msg.from_user_id;
    this.to_user_id = msg.to_user_id;
    this.msg_id = msg.msg_id;
    this.message = msg.message;
};

// Send a message
// Required fields: from_user_id, to_user_id, message
// Optional fields: none
Chat.sendMsg = function (msg, result) {

    con.query("INSERT INTO messages SET ?", msg, function (err, res) {

        if (err) {
            result(null, err)
        } else {
            result(null, res.insertId)
        }
    });
};

// Get user chat history
// Required field: from_user_id, to_user_id
// Optional fields: none
Chat.getChatHistory = function (from_user_id, to_user_id, result) {

    if (from_user_id && to_user_id) {
        con.query("SELECT * FROM messages WHERE (from_user_id = ? AND to_user_id = ?) OR (to_user_id = ? AND from_user_id = ?) ORDER BY timestamp DESC", [from_user_id, to_user_id, from_user_id, to_user_id], function (err, res) {
            if (err) {
                result(err, null);
            } else {
                // console.log('get chat history',res)
                result(null, res);
            }
        });
    } else {
        result({ "Get chat history error": "Missing required fields" }, null)
    }
};

// Get chatroom history
// Required field: chatroom_id
// Optional fields: none
Chat.getChatRoomHistory = function (chatroom_id, result) {

    if (chatroom_id) {
        con.query("SELECT * FROM messages WHERE chatroom_id = ?", chatroom_id, function (err, res) {
            if (err) {
                result(err, null);
            } else {
                result(null, res);
            }
        });
    } else {
        result({ "Get chatroom history error": "Missing required fields" }, null)
    }
};

// Mark a message as read or unread
// Required fields: from_user_id, message_id
// Optional fields: none
Chat.markReadUnread = function (read, from_user_id, msg_id, result) {

    con.query("UPDATE messages SET `read` = ? WHERE from_user_id = ? AND msg_id = ?", [read, from_user_id, msg_id], function (err, res) {
        if (err) {
            result(null, err);
        } else {
            result(res, null);
        }
    });

};

// Get all user messages
// Required field: from_user_id
// Optional fields: none
Chat.getAllUserMgs = function (user_id, result) {

    con.query("SELECT users.firstname, messages.* FROM messages JOIN users ON users.user_id = messages.to_user_id WHERE from_user_id = ? ORDER BY users.firstname", user_id, function (err, res) {

        if (err) {
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

// Delete user
// Required fields: from_user_id, message_id
// Optional fields:  to_user_id
Chat.deleteMsg = function (from_user_id, msg_id, result) {

    con.query("DELETE FROM messages WHERE from_user_id = ? AND msg_id = ?", [from_user_id, msg_id], function (err, res) {

        if (err) {
            result(err, null);
        } else {
            result(res, null);
        }
    });
};

// Get user's friends
// Required field: user_id
// Optional fields: none
Chat.getUserFriends = function (user_id, result) {

    // TO DO - Filter user contacts
    if (user_id) {
        con.query("SELECT user_id, firstname, lastname, phone FROM users", function (err, res) {
            if (err) {
                result(err);
            } else {
                result(null, res);
            }
        });
    } else {
        result({ "Get user contacts error": "Missing required field user_id" }, null);
    }
};

// Create a chat room
// Required field: chatroom name
// Optional fields: none
Chat.newChatRoom = function (body, result) {

    let place_id = body.place_id
    let chatroom_name = body.chatroom_name
    let coordinates = body.coordinates

    if (place_id && chatroom_name && coordinates) {
        con.query("INSERT INTO chatrooms (place_id, name, coordinates) VALUES (?, ?, ?)", [place_id, chatroom_name, coordinates], function (err, res) {
            if (err) {
                result(err, null);
            } else {
                result(null, res);
            }
        });
    } else {
        result({ "Error": "Missing required fields" }, null)
    }
};

// Add a user to a chat room
// Required field: user_id, chatroom id
// Optional fields: none
Chat.addUserToChatRoom = function (user_id, chatroom_id, result) {

    if (user_id && chatroom_id) {
        con.query("INSERT INTO chatroom_users (user_id, chatroom_id, is_admin) VALUES (?, ?, ?)", [user_id, chatroom_id, false], function (err, res) {
            if (err) {
                result(err, null);
            } else {
                // Get username from user id
                con.query("SELECT firstname FROM users WHERE user_id = ?", user_id, function (err, res) {
                    if (err)
                        result(err, null)
                    else {
                        // Notify chatroom new user has joined
                        if (res[0].firstname) {
                            let msg = {
                                from_user_id: context.props.user_id,
                                to_user_id: context.props.selection.to,
                                message: res[0].firstname + ' has joined chatroom',
                                chatroom_id: chatroom_id
                            }
                            Chat.sendChatRoomMsg(msg)
                        } else {
                            let msg = {
                                from_user_id: context.props.user_id,
                                to_user_id: context.props.selection.to,
                                message: res[0].username + 'new user has joined chatroom',
                                chatroom_id: chatroom_id
                            }
                            Chat.sendChatRoomMsg(msg)
                        }
                    }
                });
            }
        });
    } else {
        result({ "Error": "Missing required fields" }, null);
    }
};

Chat.isUserInChatRoom = function (user_id, chatroom_id, result) {

    if (user_id && chatroom_id) {
        con.query("SELECT user_id FROM chatroom_users WHERE user_id = ? && chatroom_id = ?", [user_id, chatroom_id], function (err, res) {
            if (err) {
                result(err, null);
            } else {
                result(null, res);
            }
        });
    } else {
        result({ "Error": "Missing required fields" }, null);
    }
};

// Get user chat room id from chatroom name
// Required field: user_id
// Optional fields: none
Chat.getUserChatRoomId = function (chatroom_name, result) {

    if (chatroom_name) {
        con.query("SELECT chatroom_id FROM chatrooms WHERE name = ? ", chatroom_name, function (err, res) {
            if (err) {
                result(err, null);
            } else {
                result(null, res);
            }
        });
    } else {
        result({ "Get user chatroom id error": "Missing required field" }, null);
    }
};

// Get chatroom name from chatroom id
// Required field: chatroom_id
// Optional fields: none
Chat.getChatRoomName = function (chatroom_ids, result) {

    if (chatroom_ids) {

        let chatrooms = [];
        let errors = [];

        for (let i = 0; i < chatroom_ids.length; i++) {

            con.query("SELECT name FROM chatrooms WHERE chatroom_id = ? ", chatroom_ids[i].chatroom_id, function (err, res) {

                if (err) {
                    // console.log('model error', err);
                    errors.push(err);
                } else {
                    // console.log('model response', res);
                    chatrooms.push(res);
                }
            });
        }

        result(null, {
            chatrooms: chatrooms,
            errors: errors
        });
    } else {
        result({ "Get user chatroom name error": "Missing required field" }, null);
    }
};

// Get user chat rooms from user id
// Required field: user_id
// Optional fields: none
Chat.getUserChatRooms = function (user_id, result) {

    // TO DO - Filter user chat groups
    if (user_id) {
        con.query("SELECT chatrooms.name, messages.* FROM messages JOIN chatrooms ON chatrooms.chatroom_id = messages.chatroom_id WHERE messages.from_user_id = ? OR messages.to_user_id = ?", [user_id, user_id], function (err, res) {
            if (err) {
                result(err, null);
            } else {
                // console.log('get chatroom id response', res);
                result(null, res);
            }
        });
    } else {
        result({ "Get user chat rooms error": "Missing required fields" }, null)
    }
};

// Send a chatroom message
// Required fields: from_user_id, to_user_id, message
// Optional fields: none
Chat.sendChatRoomMsg = function (msg, result) {

    con.query("INSERT INTO messages SET ?", msg, function (err, res) {

        if (err) {
            result(null, err)
        } else {
            result(null, res.insertId)
        }
    });
};

// Get all user chat room messages
// Required field: user_id
// Optional fields: none
Chat.getUserChatRoomMessages = function (user_id, result) {

    // TO DO - Filter user chat groups
    if (user_id) {
        con.query("SELECT chatrooms.name, messages.* FROM messages INNER JOIN chatrooms ON chatrooms.chatroom_id = messages.chatroom_id WHERE messages.from_user_id = ? OR messages.to_user_id = ? ORDER BY chatrooms.name", [user_id, user_id], function (err, res) {
            if (err) {
                result(err, null);
            } else {
                result(null, res);
            }
        });
    } else {
        console.log("Get user chat rooms error: Missing required field")
    }
};

// Get user ids of users checked in at chatrooms
// Required field: none
// Optional fields: none
Chat.getChatRoomIds = function (result) {

    con.query("SELECT chatroom_id FROM messages", function (err, res) {
        if (err) {
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

// Get checked in chat rooms
// Required field: chatroom_id
// Optional fields: none
Chat.getUsersCheckedIn = function (chatroom_id, result) {

    con.query("SELECT from_user_id FROM messages WHERE chatroom_id = ?", chatroom_id, function (err, res) {
        if (err) {
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

// Get all chat room coordinates
// Required field: none
// Optional fields: none
Chat.getAllChatRoomCoordinates = function (result) {

    // console.log('get chatroom coordinates model', result)

    con.query("SELECT * FROM chatrooms", function (err, res) {
        if (err) {
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

module.exports = Chat;