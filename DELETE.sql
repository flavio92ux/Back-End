-- 1- Exclua do banco de dados o ator com o nome de "KARL".
DELETE FROM sakila.film_actor
WHERE actor_id = 12;

DELETE FROM sakila.actor
WHERE first_name = 'KARL';

-- 2- Exclua do banco de dados os atores com o nome de "MATTHEW".
SELECT * FROM sakila.actor
WHERE first_name = 'MATTHEW';

DELETE FROM sakila.film_actor
WHERE actor_id IN (8, 103, 181);

DELETE FROM sakila.actor
WHERE first_name = 'MATTHEW';

