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




