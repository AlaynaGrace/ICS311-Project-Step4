const express = require('express');
const router = express.Router();
const mysql = require("mysql");


let pool = mysql.createPool({
  host: "0.0.0.0",
  user: "root",
  password: "Password123",
  database: "humanesociety"
});


// get info from any table and from any row
router.get("/",function(req,res){
    let table = req.query.table;
    let row = req.query.row;
    pool.getConnection(function(error,con){
        if(error){
            res.send("Error");
        }
        else{
            if(row === -1){

            }
            else if(row === 0){
        
            }
            else{
        
            }
        }
    });
});

// specifically get pet info from id
router.get("/petid",function(req,res){
    pool.getConnection(function(error,con){
        if(error){
            res.send("Error");
        }
        else{
            con.query("SELECT * FROM pets WHERE pet_id=?",[req.query.id],function(error,results){
                con.release();
                if(error){
                    res.send(error);
                }
                else{
                    res.send(results);
                }
            });
        }
    });
});

module.exports = router;