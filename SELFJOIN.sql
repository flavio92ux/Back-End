/* 1- Queremos saber os ids e custos de substituição dos filmes que possuem o mesmo custo de substituição. */
SELECT
  t1.film_id, t1.replacement_cost
FROM
  sakila.film AS t1, sakila.film AS t2
WHERE
  t1.replacement_cost = t2.replacement_cost;

/* 2- Exiba o título e a duração de empréstimo dos filmes que possuem a mesma duração.
Exiba apenas os filmes com a duração de empréstimo entre 2 e 4 dias. */
SELECT
  a.title, a.rental_duration
FROM
  sakila.film AS a, sakila.film AS b
WHERE
  a.rental_duration = b.rental_duration
AND a.rental_duration BETWEEN 2 AND 4;