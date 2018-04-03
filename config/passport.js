const LocalStrategy = require('passport-local').Strategy;
const mysql = require('mysql');

// Connect to DB
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "car_rental"
});

connection.connect();  

module.exports = function(passport) {
  passport.serializeUser(function(user, done) {
    done(null, user);
  });
  
  passport.deserializeUser(function(user, done) {
    done(null, user);
  });
  
  passport.use(new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password'
  }, (username, password, done) => {
    // Match user 
    connection.query('select * from office where Office_Username = "' + username + '"', (err, result) => {
      if(err) return done(err);
      if(!result.length) {
        return done(null, false, {message: 'No user found'});
      }

      if(!(result[0]['Office_Password'] == password)) {
        return done(null, false, {message: 'Password incorrect'});
      } else {
        return done(null, result[0]);
      }
    });
  }));
};