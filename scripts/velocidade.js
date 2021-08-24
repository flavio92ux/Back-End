/* Vamos criar mais um script. Dessa vez, para calcular a velocidade média de um carro numa corrida */

const readline = require('readline-sync');

const distancia = readline.questionInt('Digite a distancia em metros ');
const tempo = readline.questionInt('Digite o tempo em segundos ');

console.log(`voce andou a ${distancia / tempo}m/s!`);