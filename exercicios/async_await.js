/* 3- Reescreva o código do exercício anterior para que utilize async/await
 */

function getRandomNumber() {
  return Math.floor(Math.random() * 100 + 1);
  }

async function callDoMath() {
  const randomNumbers = Array.from({ length: 3 }).map(getRandomNumber);

  try {
    const result = await doMath(...randomNumbers);
    console.log(result);
    } catch (err) {
    console.error(err);
    }
}

