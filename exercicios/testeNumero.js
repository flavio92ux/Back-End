const testeNumero = (numero) => {
  if (typeof(numero) === 'string') return 'o valor deve ser um número';
  if (numero < 0) return 'negativo';
  if (numero === 0) return 'neutro';
  if (numero > 0) return 'positivo';
}

console.log(testeNumero(5));

module.exports = testeNumero;