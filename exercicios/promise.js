/* 1- Crie uma função que recebe três parâmetros retorna uma Promise .
-Caso algum dos parâmetros recebidos não seja um número,
 rejeite a Promise com o motivo "Informe apenas números".

-Caso todos os parâmetros sejam numéricos, some os dois primeiros
 e multiplique o resultado pelo terceiro ( (a + b) * c ).

-Caso o resultado seja menor que 50, rejeite a Promise com o motivo "Valor muito baixo"
 */

function operaNumeros(a, b, c) {
  const promise = new Promise((resolve, reject) => {

    const resultado = (a + b) * c;

    if (!resultado) reject(Error("Informe apenas números"));
    if (resultado < 50) reject("Valor muito baixo");


    resolve(resultado);
  });

  return promise;
}

/* 2- Escreva um código para consumir a função construída no exercício anterior.
  -Gere um número aleatório de 1 a 100 para cada parâmetro que a função recebe.
  -Para gerar um número aleatório, utilize o seguinte trecho de código: Math.floor(Math.random() * 100 + 1).
  -Chame a função do exercício anterior, passando os três números aleatórios como parâmetros.
  -Utilize then e catch para manipular a Promise retornada pela função:
    -Caso a Promise seja rejeitada, escreva na tela o motivo da rejeição.
    -Caso a Promise seja resolvida, escreva na tela o resultado do cálculo.
*/

const a = Math.floor(Math.random() * 100 + 1);
const b = Math.floor(Math.random() * 100 + 1);
const c = Math.floor(Math.random() * 100 + 1);

operaNumeros(a, b, c)
  .then(result => console.log(`sucesso: ${result}`))
  .catch(err => console.log(`erro: ${err.message}`));

