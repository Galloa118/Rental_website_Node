const express = require('express');
const router = express.Router();
const passport = require('passport');
const mysql = require('mysql');

// User login route
router.get('/login', (req, res) => {
  res.render('index');
});

// Login form post
router.post('/login', (req, res, next) => {
  passport.authenticate('local', {
    successRedirect: '/reports',
    failureRedirect: '/users/login',
    failureFlash: true
  })(req, res, next);
});

// Logout user
router.get('/logout', (req, res) => {
  req.logout();
  req.flash('success_msg', 'You are logged out');
  res.redirect('/users/login');
});

module.exports = router;