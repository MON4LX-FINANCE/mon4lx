Node JS API

# User routes

### API url
http://34.89.88.43

### get all users  
### GET 
/users

### create new user
### Required fields: Required fields: email, password, username, phone, pin 
### Optional fields: location, firstname, lastname, othernames, businessname 
### POST 
/users

### GET, PUT (update), DELETE user by id 
/users/id/:user_id

### GET user email by id 
### Required field: id 
### Optional fields: none 
/users/email/:user_id

### GET token by email 
### Required field: email 
### Optional fields: none 
/users/token/:email

### User login (GET) with authentication token 
/users/login/:token