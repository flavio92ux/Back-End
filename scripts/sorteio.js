/* Crie um "jogo de adivinhação" em que a pessoa ganha se acertar qual foi o número aleatório gerado
  -O script deve ser executado através do comando npm run sorteio
  -Utilize o readline-sync para realizar input de dados.
  -Armazene o script em sorteio.js
  -O número gerado deve ser um inteiro entre 0 e 10.
  -Caso a pessoa acerte o número, exiba na tela "Parabéns, número correto!".
  -Caso a pessoa erre o número, exiba na tela "Opa, não foi dessa vez. O número era [número sorteado]".
  -Ao final, pergunte se a pessoa deseja jogar novamente. Se sim, volte ao começo do script.
*/
const readline = require('readline-sync');

function logResultado(numero, resposta) {
  if (numero === resposta) {
    return console.log('')
  }

  return console.log(`Opa, não foi dessa vez. O número era ${resposta}`);
}

function runGame() {
  const resposta = parseInt(Math.random() * 10);
  const numero = readline.questionInt('Escolha um numero de 0 a 10: ');

  logResultado(numero, resposta);

  const novamente = readline.question(
    'Deseja jogar novamente? (Digite s para sim, e qualquer outra coisa para não)'
  );

  if (novamente !== 's') return console.log('OK, até a próxima!');

  runGame();
}

runGame();
