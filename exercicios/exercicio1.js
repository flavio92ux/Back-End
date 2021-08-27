/* Exercício 1 : Estruture os testes utilizando mocha e chai para um função que
irá dizer se um número é "positivo", "negativo" ou "neutro":
  -Essa função irá receber um número como parâmetro e retornar uma string como resposta;
  -Quando o número passado for maior que 0 deverá retornar "positivo", quando for
    menor que 0 deverá retornar "negativo" e quando igual a 0 deverá retornar "neutro";
  
    1-Descreva todos os cenário de teste utilizando describes;
    2-Descreva todos os testes que serão feitos utilizando its;
    3-Crie as asserções validando se os retornos de cada cenário tem o tipo e o valor esperado.

  ESTRATEGIA:
  1- npm init
  2- adicionar no package.json
  {
    "scripts": {
      "start": "node index.js",
      "test": "mocha tests"
    },
  }
  
Exercício 2 : Implemente a função apresentada no exercício 1, garantindo que ela irá passar em todos os testes que você escreveu.
DICA : Lembre-se de adicionar o script de test no package.json e de instalar as dependências.

Exercício 3 Adicione à função um tratamento para casos em que o parâmetro informado não seja do tipo Number.
  1- Adicione o cenário em seu arquivo de testes, passando um valor de tipo diferente a Number para a função;
  2- Adicione uma asserção para esperar que o valor retornado para esse caso seja igual uma string "o valor deve ser um número";
  3- Implemente em sua função tal validação para que o teste passe.
*/

const { expect } = require("chai");
const testeNumero = require('./testeNumero');

describe('Teste se o numero é positivo, negativo ou neutro e se e do tipo number', () => {
  it('Testa se o numero e positivo', () => {
    const resposta = testeNumero(5);
    expect(resposta).to.be.equals('positivo');
  });
  it('Testa se o numero e negativo', () => {
    const resposta = testeNumero(-1);
    expect(resposta).to.be.equals('negativo');
  });
  it('Testa se o numero e neutro', () => {
    const resposta = testeNumero(0);
    expect(resposta).to.be.equals('neutro');
  });
  it('Testa se o parametro passado e do tipo number', () => {
    const resposta = testeNumero('a');
    expect(resposta).to.be.equals('o valor deve ser um número');
  });
});
