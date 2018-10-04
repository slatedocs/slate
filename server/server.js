var express = require('express');
var path = require('path');
var app = express();

app.use(express.static(path.join(__dirname, 'build')));

app.get('/', function (req, res) {
  res.sendFile('index.html');
});

app.listen(4567, function () {
  console.log('App listening on port 4567!');
});