/* Para realizar os exercícios 1 a 7, restaure o banco de dados Pixar abaixo */

DROP SCHEMA IF EXISTS Pixar;
CREATE SCHEMA Pixar;
USE Pixar;

CREATE TABLE Movies (
  id INTEGER auto_increment PRIMARY KEY NOT NULL,
  title VARCHAR(30) NOT NULL,
  director VARCHAR(30) NULL,
  year INT NOT NULL,
  length_minutes INT NOT NULL
);

CREATE TABLE BoxOffice (
  movie_id INTEGER,
  FOREIGN KEY (movie_id) REFERENCES Movies (id),
  rating DECIMAL(2,1) NOT NULL,
  domestic_sales INT NOT NULL,
  international_sales INT NOT NULL
);

INSERT INTO Movies(title, director, year, length_minutes)
  VALUES ('Toy Story', 'John Lasseter', 1995, 81),
         ('Vida de inseto', 'Andrew Staton', 1998, 95),
         ('ratatui', 'Brad Bird', 2010, 115),
         ('UP', 'Pete Docter', 2009, 101),
         ('Carros', 'John Lasseter', 2006, 117),
         ('Toy Story 2', 'John Lasseter', 1999, 93),
         ('Valente', 'Brenda Chapman', 2012, 98);


INSERT INTO BoxOffice(movie_id, rating, domestic_sales, international_sales)
  VALUES (1, 8.3, 190000000, 170000000),
         (2, 7.2, 160000000, 200600000),
         (3, 7.9, 245000000, 239000000),
         (4, 6.1, 330000000, 540000000),
         (5, 7.8, 140000000, 310000000),
         (6, 5.8, 540000000, 600000000),
         (7, 7.5, 250000000, 190000000);

/* 1- Insira as produções da Pixar abaixo na tabela Movies : */
INSERT INTO Pixar.Movies
  (title, director, year, length_minutes)
VALUES
  ('Monstros SA', 'Pete Docter', 2001, 92),
  ('Procurando Nemo', 'John Lasseter', 200003, 107),
  ('Os Incríveis', 'Brad Bird', 2004, 116),
  ('WALL-E', 'Pete Docter', 2008, 104);

  SELECT * FROM Pixar.Movies;

  /* 2- Procurando Nemo foi aclamado pela crítica! Foi classificado em 6.8, fez 450 milhões no mercado interno e 370 milhões no mercado internacional. Adicione as informações à tabela BoxOffice . */
  SELECT id FROM Pixar.Movies
  WHERE title = 'Procurando Nemo';

  SELECT * FROM Pixar.BoxOffice;

  INSERT INTO Pixar.BoxOffice (movie_id, rating, domestic_sales, international_sales)
  VALUES (9, 6.8, 450000000, 370000000);

  /* 3- O diretor do filme "Procurando Nemo" está incorreto, na verdade ele foi dirigido por Andrew Staton. Corrija esse dado utilizando o UPDATE . */
  UPDATE Pixar.Movies
  SET director = 'Andrew Staton'
  WHERE id = 9;

  /* 4- O título do filme "Ratatouille" esta escrito de forma incorreta na tabela Movies , além disso, o filme foi lançado em 2007 e não em 2010. Corrija esses dados utilizando o UPDATE . */
  UPDATE Pixar.Movies
  SET title = 'Ratatouille', year = 2007
  WHERE title = 'ratatui';

  /* 5- Insira as novas classificações abaixo na tabela BoxOffice , lembre-se que a coluna movie_id é uma foreign key referente a coluna id da tabela Movies */
  SELECT id, title FROM Pixar.Movies
  WHERE title IN ('Monstros SA', 'Os Incríveis', 'WALL-E');

  INSERT INTO Pixar.BoxOffice (movie_id, rating, domestic_sales, international_sales)
  VALUES 
  (8, 8.5, 300000000, 250000000),
  (10, 7.4, 460000000, 510000000),
  (11, 9.9, 290000000, 280000000);

  /* 6- Exclua da tabela Movies o filme "WALL-E". */

  DELETE FROM Pixar.BoxOffice
  WHERE movie_id = 11;


  DELETE FROM Pixar.Movies
  WHERE title = 'WALL-E';

  /* 7- Exclua da tabela Movies todos os filmes dirigidos por "Andrew Staton */
  SELECT * FROM Pixar.Movies
  WHERE director = 'Andrew Staton';

  DELETE FROM Pixar.BoxOffice
  WHERE movie_id IN (2, 9);

  DELETE FROM Pixar.Movies
  WHERE director = 'Andrew Staton';

  /* 8- Altere a classificação da tabela BoxOffice para 9.0 de todos os filmes que lucraram mais de 400 milhões no mercado interno. */
  UPDATE Pixar.BoxOffice
  SET rating = 9
  WHERE domestic_sales > 400000000; 

  /* 9- Altere a classificação da tabela BoxOffice para 6.0 de todos os filmes que lucraram menos de 300 milhões no mercado internacional e mais de 200 milhões no mercado interno */
  UPDATE Pixar.BoxOffice
  SET rating = 6
  WHERE international_sales < 300000000
  AND domestic_sales > 200000000;


  