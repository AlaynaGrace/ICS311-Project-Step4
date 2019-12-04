const express = require('express');
const router = express.Router();
const mysql = require("mysql");
require('dotenv').config();


let pool = mysql.createPool({
  host: "",
  user: "root",
  password: "Password123",
  database: "humanesociety"
});


// form 1 - get info from any 3 tables
router.get("/",function(req,res){
    let table = req.query.table;
    let row = req.query.row;
    if(row === -1){
        
    }
});

module.exports = router;