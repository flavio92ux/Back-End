/* Crie um "jogo de adivinhação" em que a pessoa ganha se acertar qual foi o número aleatório gerado */
const readline = require('readline-sync');

const numero = readline.questionInt('Escolha um numero de 0 a 10: ');

const random = parseInt(Math.random() * 10);

if (numero === random) {
  console.log('Acertou!');
} else {
  console.log('Errou!');
  console.log(random);
};
