/* 1- Monte uma procedure que exiba os 10 atores mais populares, baseado em sua quantidade de filmes.
Essa procedure não deve receber parâmetros de entrada ou saída e, quando chamada, deve exibir o id do
ator ou atriz e a quantidade de filmes em que atuaram. */
USE sakila;
DELIMITER $$

CREATE PROCEDURE ShowActorByFilmAmount()
BEGIN
  SELECT
    actor_id AS 'Id do ator',
    COUNT(*) AS 'Quantidade de filmes'
  FROM
    film_actor
  GROUP BY actor_id
  ORDER BY 2 DESC;
END $$

DELIMITER ;

CALL ShowActorByFilmAmount();

/* 2- Monte uma procedure que receba como parâmetro de entrada o nome da categoria desejada em uma string
 e que exiba o id do filme , seu titulo , o id de sua categoria e o nome da categoria selecionada. Use as
tabelas film , film_category e category para montar essa procedure. */
USE sakila;
DELIMITER $$

CREATE PROCEDURE showFilmsByCategories(IN category VARCHAR(100))
BEGIN
  SELECT
    f.film_id AS 'id do filme',
    f.title AS 'Titulo',
    fc.category_id AS 'id da categoria',
    c.name AS 'nome da categoria'
  FROM
    film f
  INNER JOIN
    film_category fc ON fc.film_id = f.film_id
  INNER JOIN
    category c ON c.category_id = fc.category_id
  WHERE
    c.name LIKE collate utf8mb4_unicode_ci CONCAT('%', category, '%')
  ORDER BY 1;
END $$

DELIMITER ;

CALL showFilmsByCategories('ACTION');
