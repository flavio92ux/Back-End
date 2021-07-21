/* 1- Atualize o primeiro nome de todas as pessoas da tabela sakila.actor que possuem o primeiro nome "JULIA" para "JULES". */
UPDATE sakila.actor
SET first_name = 'JULIES'
WHERE first_name = 'JULIA';

/* 2- Foi exigido que a categoria "Sci-Fi" seja alterada para "Science Fiction". */
UPDATE sakila.category
SET name = 'Science Fiction'
WHERE name = 'Sci-Fi';