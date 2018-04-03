const express = require('express');
const router = express.Router();
const {ensureAuthenticated} = require('../helper/auth');

// Reports index
router.get('/', ensureAuthenticated, (req, res) => {
  const title = 'Dashboard';
  res.render('reports/dashboard', {
    title: title
  });
});

module.exports = router;