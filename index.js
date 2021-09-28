const express = require('express');

const app = express();

const PORT = '3000';

app.get('/', (_req, res) => {
  res.send('Ola mundo!');
});

app.listen(PORT, () => {
  console.log(`Ouvindo na porta: ${PORT}`);
});

