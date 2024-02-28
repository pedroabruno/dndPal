const express = require('express');
const app = express();
// const monstersResources = require('./resources/monstersResources.ts')
const monsters = require('../dbData/monsters.json')

app.get("/", (req, res) => res.send("Express on Vercel"));
app.get("/monsters", (req, res) => {
    res.set({
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
    })
    res.json({'monsters' : monsters.slice(0, 9)})
});
// app.get("/", (req, res) => monstersResources.getMonsters(req,res));


app.listen(3001, () => console.log("Server ready on port 3001."));

module.exports = app;