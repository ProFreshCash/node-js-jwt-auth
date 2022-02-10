const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");
const fileupload = require("express-fileupload");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });
  //saját backend 
  app.get('/osszeshos', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'mlbb'
    })
    
    connection.connect()
    
    connection.query('SELECT `hos_nev`,`kep`,laning.role FROM `heros` INNER JOIN laning ON laning.id=heros.role_id ', function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()
  
  
  
  })


  app.post('/osszeshosboltorles', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'mlbb'
    })
    
    connection.connect()
    
    connection.query('DELETE FROM `heros` WHERE `heros`.`hos_id` = '+req.body.bevitel1, function (err, rows, fields) {
      if (err) throw err
    
      console.log("Az adat törölve lett!")
      res.send("Az adat törölve lett!")
    })
    
    connection.end()


  
  })

  app.post('/uj_hos_fel', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'mlbb'
    })
    connection.connect()

    connection.query('INSERT INTO heros VAlUES (NULL,"'+req.body.bev1+'","'+req.body.bev2+'","'+req.body.bev3+'","'+req.body.bev4+'","'+req.body.bev5+'")', function (err, rows, fields) {
      if (err) throw err
    
      res.send("Sikeres feltöltés történt");
    })
    
    connection.end()

  })
  app.use(fileupload());
  app.post("/upload", (req, res) => {
    const newpath = "./kepek/";
    const file = req.files.file;
    const filename = file.name;
  
    file.mv(`${newpath}${filename}`, (err) => {
      if (err) {
        return res.status(500).send({ message: "File upload failed", code: 200 });
      }
        return res.status(200).send({ message: "File Uploaded", code: 200 });
    });
  });

};
