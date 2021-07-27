/* 1- Apenas executando uma busca na tabela actor e exibindo os resultados. */
DELIMITER $$

CREATE PROCEDURE ShowAllActors()
BEGIN
    SELECT * FROM sakila.actor;
END $$

DELIMITER ;

-- Como usar:

CALL ShowAllActors();

/* 2- Foi criada uma procedure que recebe como parâmetro uma sílaba
(syllable) e busca na tabela actor todos atores quem contêm aquela sílaba no nome. */

DELIMITER $$

CREATE PROCEDURE ShowActorsWithSyllable(IN syllable VARCHAR(100))
BEGIN
    SELECT *
    FROM sakila.actor
    WHERE first_name LIKE CONCAT('%', syllable, '%');
END $$

DELIMITER ;

-- Como usar:

CALL ShowActorsWithSyllable('lope');

/* 3- Estamos recebendo aqui o título de um filme como valor de entrada e depois buscando
dentro da procedure a duração média de um empréstimo daquele filme. Feito isso, ele é inserido
em uma variável que pode ser usada posteriormente. */
USE sakila;
DELIMITER $$

CREATE PROCEDURE ShowAverageRentalDurationOfMovie(
    IN film_name VARCHAR(300),
    OUT media_aluguel_em_dias DOUBLE
)
BEGIN
    SELECT AVG(rental_duration) INTO media_aluguel_em_dias
    FROM sakila.film
    WHERE title = film_name;
END $$

DELIMITER ;

-- Como usar:

CALL ShowAverageRentalDurationOfMovie('ACADEMY DINOSAUR', @media_de_dias);
SELECT @media_de_dias;

/* 4- Estamos gerando um novo nome para um filme, usando como base a variável film_name ,
que deve ser criada e passada como parâmetro para a procedure. O parâmetro sofrerá alterações dentro
da procedure, podendo ser usado posteriormente com o novo nome. */
USE sakila;
DELIMITER $$

CREATE PROCEDURE NameGenerator(INOUT film_name VARCHAR(300))
BEGIN
    SELECT CONCAT('ULTRA ', film_name, ' THE BEST MOVIE OF THE CENTURY')
    INTO film_name;
END $$

DELIMITER ;

-- Como usar:

SELECT 'ACE GOLDFINGER' INTO @movie_title;
CALL NameGenerator(@movie_title);
SELECT @movie_title;