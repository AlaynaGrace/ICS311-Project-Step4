const express = require('express');
const app = express();
const path = require('path');
const bodyParser = require("body-parser");

app.use(express.static(path.join(__dirname, './public')));

/* Middleware */
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(path.resolve('./server/public')));

/** REQUIRED ROUTE **/
let overview = require("./routes/routes");
app.use('/db', overview);

app.get('/*', function(req, res) {
  res.sendFile(path.join(__dirname, './public/views/index.html'));
});

let port = process.env.PORT || 3003;
app.listen(port);