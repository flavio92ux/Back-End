/* 1- Escreva uma query que exiba o maior salário da tabela. */
SELECT MAX(salary) FROM hr.employees;

/* 2- Escreva uma query que exiba a diferença entre o maior e o menor salário. */
SELECT MAX(salary) - MIN(salary) AS 'difference' FROM hr.employees;

/* 3- Escreva uma query que exiba a média salarial de cada JOB_ID , ordenando pela média salarial em ordem decrescente. */
SELECT job_id, AVG(salary) AS 'average_salary' from hr.employees
GROUP BY job_id
ORDER BY average_salary DESC;

/* 4- Escreva uma query que exiba a quantidade de dinheiro necessária para realizar o pagamento de todas as pessoas funcionárias. */
SELECT SUM(salary) AS 'payment_hiring' from hr.employees;

/* 5- Escreva uma query que exiba quatro informações: o maior salário, o menor salário, a soma de todos os salários e a média dos salários.
Todos os valores devem ser formatados para ter apenas duas casas decimais. */
SELECT MAX(salary), MIN(salary), SUM(salary), ROUND(AVG(salary), 2) from hr.employees;

/* 6- Escreva uma query que exiba a quantidade de pessoas que trabalham como pessoas programadoras ( IT_PROG ). */
SELECT COUNT(*) FROM hr.employees
GROUP BY job_id
HAVING job_id = 'IT_PROG';

/* 7- Escreva uma query que exiba a quantidade de dinheiro necessária para efetuar o pagamento de cada profissão ( JOB_ID ) */
SELECT job_id, SUM(salary) FROM hr.employees
GROUP BY job_id;

/* 8- Utilizando a query anterior, faça as alterações para que seja exibido somente a quantidade de dinheiro necessária
para cobrir a folha de pagamento das pessoas programadoras ( IT_PROG ). */
SELECT job_id, SUM(salary) FROM hr.employees
GROUP BY job_id
HAVING job_id = 'IT_PROG';

/* 9-  Escreva uma query que exiba em ordem decrescente a média salarial de todos os cargos,
exceto das pessoas programadoras ( IT_PROG ) */
SELECT job_id, AVG(salary) AS 'media_salario' FROM hr.employees
GROUP BY job_id
HAVING job_id <> 'IT_PROG'
ORDER BY media_salario DESC;

/* 10- Escreva um query que exiba média salarial e o número de funcionários de todos os departamentos
com mais de dez funcionários. Dica: agrupe pelo department_id */
SELECT COUNT(*) AS "number_employees", AVG(salary) AS 'avg salary' FROM hr.employees
GROUP BY department_id
HAVING number_employees > 10;

/* 11- Escreva uma query que atualize a coluna PHONE_NUMBER ,
de modo que todos os telefones iniciados por 515 agora devem iniciar com 777  */
UPDATE hr.employees
SET phone_number = REPLACE(phone_number, '515', '777')
WHERE phone_number LIKE '515%'; 

/* 12- Escreva uma query que só exiba as informações dos funcionários cujo o primeiro nome tenha oito ou mais caracteres. */
SELECT * FROM hr.employees
WHERE LENGTH(first_name > 7);
