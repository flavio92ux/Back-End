/* 1- Escreva uma query que exiba o maior salário da tabela. */
SELECT MAX(salary) FROM hr.employees;

/* 2- Escreva uma query que exiba a diferença entre o maior e o menor salário. */
SELECT MAX(salary) - MIN(salary) AS 'difference' FROM hr.employees;

/* 3- Escreva uma query que exiba a média salarial de cada JOB_ID , ordenando pela média salarial em ordem decrescente. */
SELECT job_id, AVG(salary) AS 'average_salary' from hr.employees
GROUP BY job_id
ORDER BY average_salary DESC;