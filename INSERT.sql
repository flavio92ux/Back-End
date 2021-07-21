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

