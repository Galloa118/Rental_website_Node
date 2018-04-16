const express = require('express');
const router = express.Router();
const {ensureAuthenticated} = require('../helper/auth');
const mysql = require('mysql');
// Connect to DB
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "car_rental"
});
connection.connect();  

// Reports index
router.get('/', ensureAuthenticated, (req, res) => {
  const title = 'Dashboard';
  connection.query('CALL monthly_revenue_by_office();', function(err, result) {
    if(err) throw err;
    let office_rev = [];
    for (let i = 0; i < result[0].length; i++) {
      if (res.locals.user.Office_ID === result[0][i].Office_ID) {
        office_rev.push(result[0][i].Jan);
        office_rev.push(result[0][i].Feb);
        office_rev.push(result[0][i].Mar);
        office_rev.push(result[0][i].Apr);
        office_rev.push(result[0][i].May);
        office_rev.push(result[0][i].Jun);
        office_rev.push(result[0][i].Jul);
        office_rev.push(result[0][i].Aug);
        office_rev.push(result[0][i].Sep);
        office_rev.push(result[0][i].Oct);
        office_rev.push(result[0][i].Nov);
        office_rev.push(result[0][i].Dec);
        console.log(office_rev);
        break;
      }
    }
    
    res.render('reports/dashboard', {
      title: title,
      data: result[0],
      rev: office_rev
    });
  });

  
});

module.exports = router;