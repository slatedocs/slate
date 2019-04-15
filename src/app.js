const express = require('express');
const path = require('path');
const morgan = require('morgan');

const ENVIRONMENT = require('./common/config').ENVIRONMENT;
const BASE_URL = require('./common/config').BASE_URL;

const app = express();

app.locals.BASE_URL = BASE_URL;

app.disable('x-powered-by');
app.use(morgan('combined'));
app.use('/developer', express.static(path.join(__dirname, '../build')))

app.use(function(req, res) {
  res.render('404');
});


app.listen(4567, () => console.log(`Quadency API Docs listening in ${ENVIRONMENT} on port 4567!`));
