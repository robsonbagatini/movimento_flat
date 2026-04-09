Create table Associado
(
id int primary key,
nome varchar(1000) not null,
sobrenome varchar(1000) not null,
idade int not null,
email varchar(100) not null
);

Create table Conta
(
id int primary key,
tipo_conta varchar(100) not null,
data_criacao timestamp not null,
id_associado int not null
);

Create table Cartao
(
id int primary key,
num_cartao int not null,
nom_impresso varchar(100) not null,
id_conta int not null,
id_associado int not null
);

Create table Movimento
(
id int primary key,
vlr_transacao decimal(10,2) not null,
des_transacao varchar(1000) not null,
data_movimento timestamp not null,
id_cartao int  not null
);

-- Chaves estrangeiras para a tabela de conta
ALTER TABLE conta
ADD CONSTRAINT fk_conta_associado
FOREIGN KEY (id_associado) REFERENCES associado(id);

-- Chaves estrangeiras para a tabela de cartao
ALTER TABLE cartao
ADD CONSTRAINT fk_cartao_conta
FOREIGN KEY (id_conta) REFERENCES conta(id);

ALTER TABLE cartao
ADD CONSTRAINT fk_cartao_associado
FOREIGN KEY (id_associado) REFERENCES associado(id);

-- Chaves estrangeiras para a tabela de movimento
ALTER TABLE movimento
ADD CONSTRAINT fk_movimento_cartao
FOREIGN KEY (id_cartao) REFERENCES cartao(id);


-- Inserindo dados na tabela associado
INSERT INTO associado (id, nome, sobrenome, idade, email) VALUES
(1, 'Fabiola', 'Bagatini', 34, 'fabiola@email.com');
INSERT INTO associado (id, nome, sobrenome, idade, email) VALUES
(2, 'Lorenzo', 'Bagatini', 9, 'lorenzo@email.com');
INSERT INTO associado (id, nome, sobrenome, idade, email) VALUES
(3, 'Robson', 'Bagatini', 40, 'robson@email.com');
INSERT INTO associado (id, nome, sobrenome, idade, email) VALUES
(4, 'Antonia', 'Bagatini', 2, 'antonia@email.com');
INSERT INTO associado (id, nome, sobrenome, idade, email) VALUES
(5, 'Helena', 'Bagatini', 66, 'helena@email.com');

-- Inserindo dados na tabela Conta
INSERT INTO conta (id, tipo_conta, data_criacao, id_associado) VALUES
(1, 'Conta Corrente', '2024-01-10 14:45:00', 1);
INSERT INTO conta (id, tipo_conta, data_criacao, id_associado) VALUES
(2, 'Conta Corrente', '2024-02-15 10:00:00', 2);
INSERT INTO conta (id, tipo_conta, data_criacao, id_associado) VALUES
(3, 'Conta Corrente', '2024-03-20 14:45:00', 3);
INSERT INTO conta (id, tipo_conta, data_criacao, id_associado) VALUES
(4, 'Conta Poupança', '2025-04-01 08:00:00', 4);
INSERT INTO conta (id, tipo_conta, data_criacao, id_associado) VALUES
(5, 'Conta Corrente', '2024-01-05 11:00:00', 5);
INSERT INTO conta (id, tipo_conta, data_criacao, id_associado) VALUES
(6, 'Conta Poupança', '2024-01-05 11:00:00', 5);
INSERT INTO conta (id, tipo_conta, data_criacao, id_associado) VALUES
(7, 'Conta Poupança', '2024-01-05 11:00:00', 3);

-- Inserindo dados na tabela Cartao
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(1, 111111, 'Fabiola Bagatini', 1, 1);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(2, 222222, 'Lorenzo Bagatini', 2, 2);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(3, 333333, 'Robson Bagatini', 3, 3);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(4, 444444, 'Antonia Bagatini', 4, 4);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(5, 555555, 'Helena Bagatini', 5, 5);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(6, 666666, 'Fabiola Bagatini', 1, 1);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(7, 777777, 'Lorenzo Bagatini', 2, 2);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(8, 888888, 'Robson Bagatini', 7, 3);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(9, 999999, 'Antonia Bagatini', 4, 4);
INSERT INTO Cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(10, 100000, 'Helena Bagatini', 6, 5);


-- Inserindo dados na tabela Movimento
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(1, 150.25, 'Compra supermercado', '2024-04-01 10:15:00', (SELECT id FROM Cartao WHERE num_cartao = 111111));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(2, 200.75, 'Pagamento luz', '2024-04-02 12:30:00', (SELECT id FROM Cartao WHERE num_cartao = 222222));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(3, 65.50, 'Cinema', '2024-04-03 20:00:00', (SELECT id FROM Cartao WHERE num_cartao = 333333));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(4, 350.00, 'Compra eletrônicos', '2024-04-04 14:45:00', (SELECT id FROM Cartao WHERE num_cartao = 444444));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(5, 50.00, 'Lanche', '2024-04-05 19:30:00', (SELECT id FROM Cartao WHERE num_cartao = 555555));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(6, 120.00, 'Pagamento escola', '2024-04-06 09:00:00', (SELECT id FROM Cartao WHERE num_cartao = 666666));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(7, 90.00, 'Compra roupas', '2024-04-07 16:20:00', (SELECT id FROM Cartao WHERE num_cartao = 777777));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(8, 45.00, 'Padaria', '2024-04-08 07:45:00', (SELECT id FROM Cartao WHERE num_cartao = 999999));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(9, 250.00, 'Compra móvel', '2024-04-09 11:00:00', (SELECT id FROM Cartao WHERE num_cartao = 111111));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(10, 180.00, 'Pagamento academia', '2024-04-10 18:00:00', (SELECT id FROM Cartao WHERE num_cartao = 222222));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(11, 60.00, 'Restaurante', '2024-04-11 20:15:00', (SELECT id FROM Cartao WHERE num_cartao = 333333));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(12, 400.00, 'Compra computador', '2024-04-12 13:00:00', (SELECT id FROM Cartao WHERE num_cartao = 444444));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(13, 35.00, 'Cinema', '2024-04-13 21:00:00', (SELECT id FROM Cartao WHERE num_cartao = 555555));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(14, 80.00, 'Supermercado', '2024-04-14 10:30:00', (SELECT id FROM Cartao WHERE num_cartao = 666666));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(15, 55.00, 'Lanchonete', '2024-04-15 19:00:00', (SELECT id FROM Cartao WHERE num_cartao = 777777));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(16, 120.00, 'Farmácia', '2024-04-16 09:15:00', (SELECT id FROM Cartao WHERE num_cartao = 999999));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(17, 210.00, 'Compra celular', '2024-04-17 14:45:00', (SELECT id FROM Cartao WHERE num_cartao = 111111));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(18, 90.00, 'Pagamento escola', '2024-04-18 17:00:00', (SELECT id FROM Cartao WHERE num_cartao = 222222));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(19, 65.00, 'Restaurante', '2024-04-19 20:30:00', (SELECT id FROM Cartao WHERE num_cartao = 333333));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(20, 500.00, 'Compra TV', '2024-04-20 16:00:00', (SELECT id FROM Cartao WHERE num_cartao = 444444));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(21, 130.00, 'Compra livros', '2024-04-21 14:00:00', (SELECT id FROM Cartao WHERE num_cartao = 555555));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(22, 160.00, 'Pagamento parcelado', '2024-04-22 11:30:00', (SELECT id FROM Cartao WHERE num_cartao = 666666));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(23, 45.00, 'Padaria', '2024-04-23 07:30:00', (SELECT id FROM Cartao WHERE num_cartao = 999999));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(24, 220.00, 'Compra smartwatch', '2024-04-24 15:45:00', (SELECT id FROM Cartao WHERE num_cartao = 111111));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(25, 75.00, 'Cinema', '2024-04-25 20:00:00', (SELECT id FROM Cartao WHERE num_cartao = 222222));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(26, 320.00, 'Compra videogame', '2024-04-26 16:45:00', (SELECT id FROM Cartao WHERE num_cartao = 333333));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(27, 90.00, 'Lanche', '2024-04-27 12:45:00', (SELECT id FROM Cartao WHERE num_cartao = 444444));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(28, 45.00, 'Padaria', '2024-04-28 07:15:00', (SELECT id FROM Cartao WHERE num_cartao = 555555));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(29, 210.00, 'Compra roupa', '2024-04-29 14:30:00', (SELECT id FROM Cartao WHERE num_cartao = 666666));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(30, 100.00, 'Pagamento academia', '2024-04-30 18:00:00', (SELECT id FROM Cartao WHERE num_cartao = 999999));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(31, 180.25, 'Compra supermercado', '2024-05-01 10:15:00', (SELECT id FROM Cartao WHERE num_cartao = 111111));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(32, 243.60, 'Pagamento luz', '2024-05-02 12:30:00', (SELECT id FROM Cartao WHERE num_cartao = 222222));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(33, 77.90, 'Cinema', '2024-05-03 20:00:00', (SELECT id FROM Cartao WHERE num_cartao = 333333));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(34, 313.40, 'Compra eletrônicos', '2024-05-04 14:45:00', (SELECT id FROM Cartao WHERE num_cartao = 444444));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(35, 50.99, 'Lanche', '2024-05-05 19:30:00', (SELECT id FROM Cartao WHERE num_cartao = 555555));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(36, 125.80, 'Pagamento escola', '2024-05-06 09:00:00', (SELECT id FROM Cartao WHERE num_cartao = 666666));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(37, 94.50, 'Compra roupas', '2024-05-07 16:20:00', (SELECT id FROM Cartao WHERE num_cartao = 777777));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(38, 46.80, 'Padaria', '2024-05-08 07:45:00', (SELECT id FROM Cartao WHERE num_cartao = 999999));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(39, 251.25, 'Compra móvel', '2024-05-09 11:00:00', (SELECT id FROM Cartao WHERE num_cartao = 111111));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(40, 182.75, 'Pagamento academia', '2024-05-10 18:00:00', (SELECT id FROM Cartao WHERE num_cartao = 222222));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(41, 63.30, 'Restaurante', '2024-05-11 20:15:00', (SELECT id FROM Cartao WHERE num_cartao = 333333));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(42, 397.60, 'Compra computador', '2024-05-12 13:00:00', (SELECT id FROM Cartao WHERE num_cartao = 444444));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(43, 36.50, 'Cinema', '2024-05-13 21:00:00', (SELECT id FROM Cartao WHERE num_cartao = 555555));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(44, 82.20, 'Supermercado', '2024-05-14 10:30:00', (SELECT id FROM Cartao WHERE num_cartao = 666666));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(45, 56.00, 'Lanchonete', '2024-05-15 19:00:00', (SELECT id FROM Cartao WHERE num_cartao = 777777));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(46, 125.50, 'Farmácia', '2024-05-16 09:15:00', (SELECT id FROM Cartao WHERE num_cartao = 999999));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(47, 215.30, 'Compra celular', '2024-05-17 14:45:00', (SELECT id FROM Cartao WHERE num_cartao = 111111));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(48, 88.40, 'Pagamento escola', '2024-05-18 17:00:00', (SELECT id FROM Cartao WHERE num_cartao = 222222));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(49, 67.00, 'Restaurante', '2024-05-19 20:30:00', (SELECT id FROM Cartao WHERE num_cartao = 333333));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(50, 510.50, 'Compra TV', '2024-05-20 16:00:00', (SELECT id FROM Cartao WHERE num_cartao = 444444));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(51, 136.25, 'Compra livros', '2024-05-21 14:00:00', (SELECT id FROM Cartao WHERE num_cartao = 555555));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(52, 163.80, 'Pagamento parcelado', '2024-05-22 11:30:00', (SELECT id FROM Cartao WHERE num_cartao = 666666));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(53, 46.50, 'Padaria', '2024-05-23 07:30:00', (SELECT id FROM Cartao WHERE num_cartao = 999999));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(54, 220.75, 'Compra smartwatch', '2024-05-24 15:45:00', (SELECT id FROM Cartao WHERE num_cartao = 111111));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(55, 77.00, 'Cinema', '2024-05-25 20:00:00', (SELECT id FROM Cartao WHERE num_cartao = 222222));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(56, 321.20, 'Compra videogame', '2024-05-26 16:45:00', (SELECT id FROM Cartao WHERE num_cartao = 333333));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(57, 92.30, 'Lanche', '2024-05-27 12:45:00', (SELECT id FROM Cartao WHERE num_cartao = 444444));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(58, 45.50, 'Padaria', '2024-05-28 07:15:00', (SELECT id FROM Cartao WHERE num_cartao = 555555));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(59, 212.20, 'Compra roupa', '2024-05-29 14:30:00', (SELECT id FROM Cartao WHERE num_cartao = 666666));
INSERT INTO Movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(60, 102.00, 'Pagamento academia', '2024-05-30 18:00:00', (SELECT id FROM Cartao WHERE num_cartao = 999999));