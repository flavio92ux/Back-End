/* Feito isso, o próximo passo é escrever o código que, de fato, resolve a Promise.
Já combinamos que nossa função promete ler um arquivo. Então, agora, vamos colocar
dentro da função executor o código que busca resolver essa promessa: */
const fs = require('fs');

function readFilePromise (fileName) {
  return new Promise((resolve, reject) => {

    fs.readFile(fileName, (err, content) => {
      if (err) return reject(err);
      resolve(content);
    });

  });
}