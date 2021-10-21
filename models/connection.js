const mysql = require('mysql2/promise');

const connection = mysql.createPool({
  host: 'localhost',
  user: 'flavio',
  password: '',
  database: 'mvc_example'});

module.exports = connection;