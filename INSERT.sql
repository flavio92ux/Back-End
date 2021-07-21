/* 1- Insira um novo funcionário na tabela sakila.staff . */
INSERT INTO sakila.staff
  (first_name, last_name, address_id, email, store_id, username, password, active)
VALUES
  ('flavio', 'franco', 6, 'flavio.win@gmail.com', 1, 'flavio92ux', '123', 1);

/* 2- Insira dois funcionários novos em apenas uma query . */
INSERT INTO sakila.staff
  (first_name, last_name, address_id, email, store_id, username, password, active)
VALUES
  ('joana', 'tauber', 7, 'sjoanaesc@gmail.com', 1, 'joanete', '123', 1),
  ('dudu', 'zinha', 8, 'hat@gmail.com', 1, 'gato', '123', 1);

  /* 3- Selecione os cinco primeiros nomes e sobrenomes da tabela sakila.customer e cadastre essas pessoas como atores na tabela sakila.actor . */
INSERT INTO sakila.actor (first_name, last_name)
SELECT first_name, last_name FROM sakila.customer
ORDER BY customer_id
LIMIT 5;

/* 4- Cadastre três categorias de uma vez só na tabela sakila.category . */
INSERT INTO sakila.category (name)
VALUES ('Comedia'), ('Acao'), ('Aventura');

/* 5- Cadastre uma nova loja na tabela sakila.store . */
INSERT INTO sakila.store (manager_staff_id, address_id)
VALUES (3, 3);