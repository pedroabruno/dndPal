import { createRequire } from "module";
const require = createRequire(import.meta.url);
const monsters = require("./monsters.json");

const express = require('express')
const sv = express()

const PORT = process.env.PORT ?? 1234

sv.use((req,res,next)=>{
    //check permisos
    console.log('I should be checking permissions')
    next()
})

sv.get('/', (req,res)=> {
    res.send('<div>MAIN PAGE</div>')
})

sv.get('/monsters', (req,res)=> {
    res.json(monsters[0])
})

sv.listen(PORT, () => {
    console.log(`sv running on port: ${PORT}`)
})

export default sv;