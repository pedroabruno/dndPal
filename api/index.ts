require('dotenv').config();
const monsters = require('../dbData/monsters.json')
var cors = require('cors');
const express = require('express');
const app = express();
var allowedOrigins = ['http://localhost:3000','https://dnd-pal-page.vercel.app'];
const {Pool} = require('pg');
const connString = process.env.POSTGRES_URL
const dbPool = new Pool({connectionString : connString})

app.use(cors({
    origin: function(origin, callback){
      // allow requests with no origin 
      // (like mobile apps or curl requests)
      if(!origin) return callback(null, true);
      if(allowedOrigins.indexOf(origin) === -1){
        var msg = 'The CORS policy for this site does not ' +
                  'allow access from the specified Origin.';
        return callback(new Error(msg), false);
      }
      return callback(null, true);
    }
  }));

app.use((req,res,next)=>{
    // use for checking credentials
    next()
})
app.get("/", (req, res) => res.send("Express on Vercel"));
app.get("/monsters", (req, res) => {
    res.set({
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
    })
    res.json({'monsters' : monsters.slice(0, 9)})
});
app.get("/battles", async (req, res) => {
    try{
        const data = await dbPool.query('SELECT * FROM ENCOUNTER where idUser = 1')
        res.status(200).json({encounters: data.rows})
    }catch(error){
        console.log(error)
    }
});


app.listen(3001, () => console.log("Server ready on port 3001."));

module.exports = app;