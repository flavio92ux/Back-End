const express = require('express');

const app = express();

const PORT = process.env.PORT || 3000;
const MESSAGE = process.env.MESSAGE || 'Ola mundo!';

app.get('/', (_req, res) => {
  res.send(MESSAGE);
});

app.listen(PORT, () => {
  console.log(`Ouvindo na porta: ${PORT}`);
});

