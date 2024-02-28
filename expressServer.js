import { createRequire } from "module";
const require = createRequire(import.meta.url);
const monsters = require("./monsters.json");

const express = require('express')
const app = express()

const PORT = process.env.PORT ?? 3001

// app.use((req,res,next)=>{
//     //check permisos
//     console.log('I should be checking permissions')
//     next()
// })

app.get("/", (req, res) => res.send("Express on Vercel"));

app.listen(PORT, () => console.log("Server ready on port : " + PORT));

export default app;