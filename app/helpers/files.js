// File Manager

// Dependencies
let fs = require('fs');
let path = require('path');

// URL for file server
let bucket = 'https://'

// container
let files = {};

files.save = (req, res) => {

  // console.log('save file request', req);

  const image = req.files.myFile;
  const path = bucket + image.name;

  // Move file to destination folder
  image.mv(path, (error) => {
    if (error) {
      console.error(error);
      res.writeHead(500, {'Content-Type': 'application/json'});
      res.end(JSON.stringify({status: 'error', message: error}));
      return;
    }

    res.writeHead(200, {'Content-Type': 'application/json'});
    res.end(JSON.stringify({status: 'success', path: image.name}));
  })
}

// Export module
module.exports = files;
