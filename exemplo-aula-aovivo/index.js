const express = require('express');
const bodyParser = require('body-parser');

const songModel = require('./models/songModel');
const {
  getAll,
  getById,
  createAuthor,
  deleteAuthor,
} = require('./controllers/authorController');

const app = express();
app.use(bodyParser.json());

const PORT = 3000;

app.get('/authors', getAll);

app.get('/authors/:id', getById);

app.post('/authors', createAuthor);

app.delete('/authors/:id', deleteAuthor);

app.listen(PORT, () => {
  console.log('Online');
});