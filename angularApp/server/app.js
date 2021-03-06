var express = require('express')
var path = require('path')
var favicon = require('serve-favicon')
var logger = require('morgan')
var cookieParser = require('cookie-parser')
var bodyParser = require('body-parser')

var app = express()

app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(cookieParser())

/**
 * Development Settings
 */
if (app.get('env') === 'development') {
  app.use(favicon(path.join(__dirname, '../client/app', 'favicon.ico')))

  // This will change in production since we'll be using the dist folder
  app.use(express.static(path.join(__dirname, '../client')))
  // This covers serving up the index page
  app.use(express.static(path.join(__dirname, '../client/.tmp')))
  app.use(express.static(path.join(__dirname, '../client/app')))

  // Error Handling
  app.use(function(err, req, res, next) {
      res.status(err.status || 500)
      res.render('error', {
          message: err.message,
          error: err
      })
  })

  app.get('*', function(req, res) {
    res.sendfile(path.join(__dirname, '../client/app', 'index.html'))
  })
}

/**
 * Production Settings
 */
if (app.get('env') === 'production') {
  app.use(favicon(path.join(__dirname, 'dist', 'favicon.ico')))

  // changes it to use the optimized version for production
  app.use(express.static(path.join(__dirname, 'dist')))

  // production error handler
  // no stacktraces leaked to user
  app.use(function(err, req, res, next) {
      res.status(err.status || 500)
      res.render('error', {
          message: err.message,
          error: {}
      })
  })

  app.get('*', function(req, res) {
    res.sendfile(path.join(__dirname, 'dist', 'index.html'))
  })
}

module.exports = app
