const express = require('express');
const router = express.Router();
const mysql = require("mysql");


let pool = mysql.createPool({
  host: "34.70.109.84",
  user: "root",
  password: "Password123",
  database: "humanesociety"
});


// get info from any table and from any row
router.get("/",function(req,res){
    let table = req.query.table;
    let row = req.query.row;
    console.log(table,row);
    pool.getConnection(function(error,con){
        if(error){
            res.send("Error");
        }
        else if(table === "vet_visits"){
            console.log("getting vet visit info");
        }
        else{
            con.query("SELECT * FROM ?",[table],function(error,results){
                con.release();
                if(error){
                    res.send(error);
                }
                else{
                    console.log(results[row-1]);
                    res.send(results[row-1]);
                }
            });
        }
    });
});

// specifically get pet info from id
router.get("/petid",function(req,res){
    console.log("In router /db/petid " + req.query);
    pool.getConnection(function(error,con){
        if(error){
            console.log(error);
            res.send("Error");
        }
        else{
            con.query("SELECT * FROM pets WHERE pet_id=?",[req.query.id],function(error,results){
                con.release();
                if(error){
                    console.log(error);
                    res.send(error);
                }
                else{
                    console.log(results[0]);
                    res.send(results[0]);
                }
            });
        }
    });
});

module.exports = router;