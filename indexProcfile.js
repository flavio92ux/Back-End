const express = require('express');

const app = express();

const PORT = process.env.PORT || 3000;
const MESSAGE = process.env.MESSAGE || 'Ola mundo!';

app.get('/', (_req, res) => {
  res.send(MESSAGE + 'E o procfile tambem!!! =D');
});

app.listen(PORT, () => {
  console.log(`Ouvindo na porta: ${PORT}`);
});

