/* 1- Utilizando o INNER JOIN , encontre as vendas nacionais ( domestic_sales ) e
internacionais ( international_sales ) de cada filme. */
SELECT
  m.title, b.domestic_sales, b.international_sales
FROM
  Pixar.Movies m
INNER JOIN
  Pixar.BoxOffice b ON b.movie_id = m.id;

/* 2- Utilizando o INNER JOIN , faça uma busca que retorne o número de vendas para
cada filme que possui um número maior de vendas internacionais ( international_sales )
do que vendas nacionais ( domestic_sales ) */
SELECT
  m.title, b.domestic_sales, b.international_sales
FROM
  Pixar.Movies m
INNER JOIN
  Pixar.BoxOffice b ON b.movie_id = m.id
HAVING
  b.international_sales > b.domestic_sales;

/* 3- Utilizando o INNER JOIN , faça uma busca que retorne os filmes e sua avaliação ( rating ) em ordem decrescente */
SELECT
  m.title, b.rating
FROM
  Pixar.Movies m
INNER JOIN
  Pixar.BoxOffice b ON b.movie_id = m.id
ORDER BY b.rating DESC;

/* 4- Utilizando o LEFT JOIN , faça uma busca que retorne todos os dados dos cinemas,
 mesmo os que não possuem filmes em cartaz e, adicionalmente, os dados dos filmes que
estão em cartaz nestes cinemas. Retorne os nomes dos cinemas em ordem alfabética. */
SELECT t.name, t.location, m.title FROM Theater AS t
LEFT JOIN Movies AS m
ON m.theater_id = t.id
ORDER BY t.name;

/* 5- Utilizando o RIGHT JOIN , faça uma busca que retorne todos os dados dos filmes, mesmo os que não estão em cartaz e,
adicionalmente, os dados dos cinemas que possuem estes filmes em cartaz. Retorne os nomes dos cinemas em ordem alfabética. */
SELECT t.name, t.location, m.title FROM Theater AS t
RIGHT JOIN Movies AS m
ON m.theater_id = t.id
ORDER BY t.name;

/* 6- Faça duas buscas, uma utilizando SUBQUERY e outra utilizando INNER JOIN , que retornem os títulos dos filmes que possuem
 avaliação maior que 7.5 */
SELECT
  title
FROM
  Movies
WHERE id IN (SELECT movie_id FROM BoxOffice WHERE rating > 7.5);

SELECT
  title
FROM
  Movies m
INNER JOIN
  BoxOffice b ON b.movie_id = m.id
WHERE b.rating > 7.5;

/* 7- Faça duas buscas, uma utilizando SUBQUERY e outra utilizando INNER JOIN ,
que retornem as avaliações dos filmes lançados depois de 2009. */
SELECT rating FROM BoxOffice
WHERE movie_id IN (SELECT id FROM Movies WHERE year > 2009);

SELECT rating FROM Pixar.BoxOffice b
INNER JOIN Pixar.Movies m ON m.id = b.movie_id WHERE m.year > 2009;

/* 8- Utilizando o EXISTS , selecione o nome e localização dos cinemas que possuem filmes em cartaz. */
SELECT t.name, t.location FROM Theater as t
WHERE EXISTS (SELECT * FROM Movies WHERE t.id = Movies.theater_id);

/* 9- Utilizando o EXISTS , selecione o nome e localização dos cinemas que não possuem filmes em cartaz. */
SELECT t.name, t.location FROM Theater as t
WHERE NOT EXISTS (SELECT * FROM Movies WHERE t.id = Movies.theater_id);

/* 10- Utilizando o INNER JOIN , selecione todas as informações dos filmes com avaliação maior que 8 e que estejam em cartaz. */
SELECT * FROM Movies AS m
INNER JOIN BoxOffice AS b ON m.id = b.movie_id WHERE b.rating > 8 AND m.theater_id IS NOT NULL;

/* 11- Utilizando o SELF JOIN , selecione os títulos e duração dos filmes que possuem o mesmo diretor. */
SELECT t1.title, t1.length_minutes, t2.title, t2.length_minutes FROM Movies t1, Movies t2
WHERE t1.director = t2.director;

/* 12- Faça duas buscas, uma utilizando SUBQUERY e outra utilizando INNER JOIN , que retornem o título dos filmes
que arrecadaram 500 milhões ou mais, e que possuem duração maior que 110 minutos. */
SELECT title FROM Movies
WHERE length_minutes > 110
AND id IN (SELECT movie_id FROM BoxOffice WHERE (domestic_sales + international_sales) > 500000000);

SELECT title FROM Movies m
INNER JOIN BoxOffice b
ON b.movie_id = m.id
WHERE (b.domestic_sales + b.international_sales) > 500000000
AND m.length_minutes > 110;
