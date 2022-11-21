var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const session = require("express-session");
const sequelize = require("sequelize");
const connection = require("./database/database");
const slugify = require("slugify");

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var investidorRouter = require('./routes/investidor/InvestidorController');

var app = express();

// View engine
app.set("view engine", "ejs");

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/', investidorRouter);



connection
  .authenticate()
  .then(() => {
    console.log("Conexão feita com sucesso!");
  })
  .catch((error) => {
    console.log(error);
  });


module.exports = app;
