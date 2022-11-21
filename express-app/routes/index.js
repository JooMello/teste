var express = require('express');
const Investidor = require('./investidor/Investidor');
var router = express.Router();

var app = express();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', );
});


app.get('/investidor/:slug', (req, res) => {
  var slug = req.params.slug;
  Investidor.findOne({
    where:{
      slug:slug,
    },
  }).then((investidor) => {
    res.render("investidor")
  })
})

module.exports = router;
