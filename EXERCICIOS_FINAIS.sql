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






