/* Crie um script para calcular o Índice de Massa Corporal(IMC) de uma pessoa. */
const readline = require('readline-sync');

const peso = readline.questionInt('Digite seu peso em kg ');
const altura = readline.questionFloat('Digite sua altura em metros ');

function calculaIMC() {
  return (peso / (altura * altura)).toFixed(2);
};

function faixaIMC() {
  const imc = calculaIMC();
  if (imc < 18.5) {
    console.log('Abaixo do peso (magreza)');
  } else if (imc <= 24.9) {
    console.log('Peso normal');
  } else if (imc <= 29.9) {
    console.log('Acima do peso (sobrepeso)');
  } else if (imc <= 34.9) {
    console.log('Obesidade grau I');
  } else if (imc <= 39.9) {
    console.log('Obesidade grau II');
  } else {
    console.log('Obesidade graus III e IV');
  };
};

function limites() {
  console.log(`Com ${ 18.5 * altura * altura } ou menos estou abaixo do peso`);
  console.log(`Com ${ 24.9 * altura * altura } ou mais estou com sobrepeso`);
  return;
}

console.log(calculaIMC());
faixaIMC();
limites();
