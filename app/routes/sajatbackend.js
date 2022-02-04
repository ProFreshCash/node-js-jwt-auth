const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });
  //saját backend 
  app.get('/anyagok', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'anyagok'
    })
    
    connection.connect()
    
    connection.query('SELECT * from anyag', function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()

  })


  app.post('/anyagtorles', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'anyagok'
    })
    
    connection.connect()
    
    connection.query('DELETE FROM `anyag` WHERE `anyag`.`anyag_id` = '+req.body.bevitel1, function (err, rows, fields) {
      if (err) throw err
    
      console.log("Az adat törölve lett!")
      res.send("Az adat törölve lett!")
    })
    
    connection.end()


  
  })

  app.post('/uj_anyag_fel', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'anyagok'
    })
    connection.connect()

    connection.query('INSERT INTO anyagok VAlUES (NULL,"'+req.body.bev1+'","'+req.body.bev2+'","'+req.body.bev3+'","'+req.body.bev4+'","'+req.body.bev5+'","'+req.body.bev6+'")', function (err, rows, fields) {
      if (err) throw err
    
      res.send("Sikeres feltöltés történt");
    })
    
    connection.end()

  })

};
