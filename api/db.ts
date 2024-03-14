require('dotenv').config();
const {Pool} = require('pg');
const connString = process.env.POSTGRES_URL
const dbPool = new Pool({connectionString : connString})
module.exports = dbPool