/* 1- Monte uma query que exiba o id do ator , nome do ator e id do filme em que ele já atuou usando as tabelas actor e film_actor */
SELECT 
    A.actor_id, A.first_name, F.film_id
FROM
    sakila.actor AS A
        INNER JOIN
    sakila.film_actor AS F ON A.actor_id = F.actor_id;

/* 2- Use o JOIN para exibir o nome , sobrenome e endereço de cada um dos funcionários do banco. Use as tabelas staff e address */
SELECT 
    first_name, last_name, address
FROM
    sakila.staff AS S
        INNER JOIN
    sakila.address AS A ON S.address_id = A.address_id;

/* 3- Exiba o id do cliente , nome e email dos primeiros 100 clientes, ordenados pelo nome em ordem decrescente,
juntamente com o id do endereço e o nome da rua onde o cliente mora. Essas informações podem ser encontradas nas
tabelas customer e address */
SELECT
  C.customer_id, C.first_name, C.email, A.address_id, A.address
FROM
    sakila.customer as C
      INNER JOIN
    sakila.address AS A ON C.address_id = A.address_id
ORDER BY C.first_name DESC
LIMIT 100;

/* 4- Exiba o nome , email , id do endereço , endereço e distrito dos
clientes que moram no distrito da California e que contêm "rene" em seus nomes.As informações podem
ser encontradas nas tabelas address e customer */
SELECT
  c.first_name, c.email, c.address_id, a.address, a.district
FROM
  sakila.address AS a
    INNER JOIN
  sakila.customer AS c ON a.address_id = c.address_id
WHERE
  a.district = 'California'
    AND c.first_name LIKE '%rene%';

/* 5-  */