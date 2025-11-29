-- Arquivo: 02_inserts.sql
-- Descrição: Massa de dados ajustada para o DDL do Workbench

USE plataforma;

-- 1. Tabela CATEGORIA

INSERT INTO categoria (id_categoria, nome, ativa) VALUES
(1, 'Show Musical', 1),
(2, 'Teatro', 1),
(3, 'Stand-up Comedy', 1),
(4, 'Workshop Técnico', 1),
(5, 'Festival Gastronômico', 1),
(6, 'Exposição de Arte', 1);


-- 2. Tabela LOCAL

INSERT INTO local (id_local, nome, endereco, cidade, estado, capacidade_maxima) VALUES
(1, 'Arena Aurora', 'Av. das Nações, 1000', 'São Paulo', 'SP', 5000),
(2, 'Teatro Municipal', 'Praça Ramos, 12', 'São Paulo', 'SP', 1500),
(3, 'Centro de Convenções Tech', 'Rua Inovação, 500', 'Campinas', 'SP', 300),
(4, 'Espaço Cultural Rio', 'Av. Atlântica, 200', 'Rio de Janeiro', 'RJ', 2000),
(5, 'Auditório da Universidade', 'Rua do Saber, 88', 'Belo Horizonte', 'MG', 150),
(6, 'Galeria Moderna', 'Rua das Artes, 55', 'Curitiba', 'PR', 400);


-- 3. Tabela CLIENTE (Sem coluna documento)

INSERT INTO cliente (id_cliente, nome, email) VALUES
(1, 'Ana Silva', 'ana.silva@email.com'),
(2, 'Bruno Souza', 'bruno.souza@email.com'),
(3, 'Carlos Lima', 'carlos.lima@email.com'),
(4, 'Daniela Alves', 'daniela.alves@email.com'),
(5, 'Eduardo Pereira', 'eduardo.pereira@email.com'),
(6, 'Fernanda Costa', 'fernanda.costa@email.com'),
(7, 'Gabriel Rocha', 'gabriel.rocha@email.com'),
(8, 'Helena Dias', 'helena.dias@email.com'),
(9, 'Igor Martins', 'igor.martins@email.com'),
(10, 'Julia Santos', 'julia.santos@email.com'),
(11, 'Lucas Oliveira', 'lucas.oliveira@email.com'),
(12, 'Mariana Ferreira', 'mariana.ferreira@email.com'),
(13, 'Nicolas Rodrigues', 'nicolas.rodrigues@email.com'),
(14, 'Olivia Gomes', 'olivia.gomes@email.com'),
(15, 'Pedro Barbosa', 'pedro.barbosa@email.com'),
(16, 'Quezia Nunes', 'quezia.nunes@email.com'),
(17, 'Rafael Mendes', 'rafael.mendes@email.com'),
(18, 'Sofia Carvalho', 'sofia.carvalho@email.com'),
(19, 'Tiago Castro', 'tiago.castro@email.com'),
(20, 'Ursula Pinto', 'ursula.pinto@email.com'),
(21, 'Vinicius Cardoso', 'vinicius.cardoso@email.com'),
(22, 'Wagner Ribeiro', 'wagner.ribeiro@email.com'),
(23, 'Xavier Correia', 'xavier.correia@email.com'),
(24, 'Yasmin Teixeira', 'yasmin.teixeira@email.com'),
(25, 'Zeca Camargo', 'zeca.camargo@email.com'),
(26, 'Amanda Lopes', 'amanda.lopes@email.com'),
(27, 'Bernardo Farias', 'bernardo.farias@email.com'),
(28, 'Camila Moura', 'camila.moura@email.com'),
(29, 'Diego Nascimento', 'diego.nascimento@email.com'),
(30, 'Elisa Moraes', 'elisa.moraes@email.com'),
(31, 'Fabio Junior', 'fabio.jr@email.com'),
(32, 'Gustavo Lima', 'gustavo.lima@email.com');


-- 4. Tabela ARTISTA (Coluna nome_artista)

INSERT INTO artista (id_artista, nome_artista) VALUES
(1, 'Banda Supernova'),
(2, 'DJ Eletro'),
(3, 'Cia de Teatro Sol'),
(4, 'Fabio Porchat Cover'),
(5, 'Dev Senior Palestrante'),
(6, 'Orquestra Sinfônica'),
(7, 'Chef Jacquin Cover'),
(8, 'Rock Legends'),
(9, 'Marisa Monte Cover'),
(10, 'Coach de Carreira'),
(11, 'Grupo de Pagode Zueira'),
(12, 'Pintores do Amanhã');


-- 5. Tabela EVENTO

INSERT INTO evento (id_evento, id_categoria, id_local_previsto, titulo, descricao, curadoria, status) VALUES
(1, 1, 1, 'Rock in Aurora', 'Festival de Rock Clássico com grandes nomes.', 'João Curador', 'Ativo'),
(2, 1, 4, 'Noite Eletrônica', 'O melhor da música eletrônica em uma noite única.', 'Maria Curadora', 'Ativo'),
(3, 2, 2, 'O Fantasma da Ópera', 'Clássico do teatro musical mundial.', 'Pedro Artes', 'Ativo'),
(4, 3, 2, 'Rindo Alto', 'Show de Stand-up comedy com convidados.', 'Comedy Club', 'Ativo'),
(5, 4, 3, 'Imersão Java', 'Workshop avançado de Java e Spring Boot.', 'Tech School', 'Ativo'),
(6, 4, 3, 'DevOps Summit', 'Conferência sobre infraestrutura e cloud.', 'Tech School', 'Ativo'),
(7, 5, 5, 'Sabores do Brasil', 'Degustação de pratos típicos regionais.', 'Guia Garfo', 'Ativo'),
(8, 1, 1, 'Pop Festival', 'Festival de música Pop para jovens.', 'João Curador', 'Ativo'),
(9, 2, 2, 'Hamlet', 'Peça de Shakespeare adaptada.', 'Pedro Artes', 'Ativo'),
(10, 3, 2, 'Comédia em Pé', 'Show de humor improvisado.', 'Comedy Club', 'Cancelado'),
(11, 4, 5, 'Marketing Digital 360', 'Curso intensivo de marketing e vendas.', 'Growth Hub', 'Ativo'),
(12, 1, 4, 'Samba de Raiz', 'Roda de samba tradicional carioca.', 'Cultura BR', 'Ativo'),
(13, 6, 6, 'Arte Moderna 2025', 'Exposição de quadros e esculturas.', 'Galeria Fine', 'Ativo');


-- 6. Tabela EVENTO_ARTISTA

INSERT INTO evento_artista (id_evento, id_artista, papel) VALUES
(1, 1, 'Headliner'),
(1, 8, 'Abertura'),
(2, 2, 'DJ Principal'),
(3, 3, 'Elenco Principal'),
(4, 4, 'Comediante Principal'),
(5, 5, 'Instrutor'),
(6, 5, 'Painelista'),
(7, 7, 'Chef Convidado'),
(8, 9, 'Headliner'),
(9, 3, 'Elenco'),
(10, 4, 'Comediante'),
(12, 11, 'Grupo Principal'),
(13, 12, 'Expositor');


-- 7. Tabela SESSAO

INSERT INTO sessao (id_sessao, id_evento, data_hora, status, lote) VALUES
(1, 1, '2025-11-10 20:00:00', 'aberta', 'Lote 1'),
(2, 1, '2025-11-11 20:00:00', 'aberta', 'Lote 1'),
(3, 2, '2025-11-12 23:00:00', 'aberta', 'Lote 2'),
(4, 3, '2025-11-15 19:00:00', 'esgotada', 'Lote Final'),
(5, 3, '2025-11-16 19:00:00', 'aberta', 'Lote 2'),
(6, 4, '2025-11-20 21:00:00', 'aberta', 'Lote 1'),
(7, 5, '2025-12-01 09:00:00', 'aberta', 'Lote Único'),
(8, 6, '2025-12-05 09:00:00', 'aberta', 'Lote Early Bird'),
(9, 7, '2025-12-10 12:00:00', 'aberta', 'Lote 1'),
(10, 8, '2026-01-15 18:00:00', 'aberta', 'Lote 1'),
(11, 9, '2026-01-20 20:00:00', 'aberta', 'Lote 1'),
(12, 10, '2025-11-25 21:00:00', 'cancelada', 'Lote 1'),
(13, 11, '2025-12-02 14:00:00', 'aberta', 'Lote 1'),
(14, 12, '2025-12-08 17:00:00', 'aberta', 'Lote 2'),
(15, 1, '2025-11-12 20:00:00', 'aberta', 'Lote 2'),
(16, 2, '2025-11-13 23:00:00', 'aberta', 'Lote 1'),
(17, 3, '2025-11-17 19:00:00', 'aberta', 'Lote 1'),
(18, 4, '2025-11-21 21:00:00', 'esgotada', 'Lote 1'),
(19, 5, '2025-12-02 09:00:00', 'aberta', 'Lote Único'),
(20, 6, '2025-12-06 09:00:00', 'aberta', 'Lote 2'),
(21, 7, '2025-12-11 12:00:00', 'aberta', 'Lote 1'),
(22, 8, '2026-01-16 18:00:00', 'aberta', 'Lote 1'),
(23, 9, '2026-01-21 20:00:00', 'aberta', 'Lote 1'),
(24, 11, '2025-12-03 14:00:00', 'aberta', 'Lote 1'),
(25, 12, '2025-12-09 17:00:00', 'aberta', 'Lote 1'),
(26, 1, '2024-10-10 20:00:00', 'aberta', 'Lote 1'), -- Sessão passada
(27, 3, '2024-10-15 19:00:00', 'aberta', 'Lote 1'), -- Sessão passada
(28, 5, '2024-10-20 09:00:00', 'aberta', 'Lote Único'), -- Sessão passada
(29, 2, '2025-11-14 23:00:00', 'aberta', 'Lote 1'),
(30, 4, '2025-11-22 21:00:00', 'aberta', 'Lote 1'),
(31, 13, '2025-12-15 10:00:00', 'aberta', 'Lote 1');


-- 8. Tabela TIPO_INGRESSO

INSERT INTO tipo_ingresso (id_tipo_ingresso, nome, preco_base) VALUES
(1, 'Inteira', 100.00),
(2, 'Meia-Entrada', 50.00),
(3, 'VIP', 250.00),
(4, 'Camarote', 400.00);


-- 9. Tabela SESSAO_TIPO_INGRESSO (Adicionado id_sessao_tipo manual)

INSERT INTO sessao_tipo_ingresso (id_sessao_tipo, id_sessao, id_tipo_ingresso, preco, quantidade_ofertada, quantidade_vendida) VALUES
(1, 1, 1, 100.00, 200, 50), (2, 1, 2, 50.00, 200, 50), (3, 1, 3, 250.00, 50, 10),
(4, 2, 1, 120.00, 200, 10), (5, 2, 2, 60.00, 200, 5),
(6, 3, 1, 80.00, 300, 100), (7, 3, 3, 200.00, 50, 20),
(8, 4, 1, 150.00, 100, 100), -- Esgotada
(9, 5, 1, 150.00, 100, 20),
(10, 6, 1, 60.00, 150, 30), (11, 6, 2, 30.00, 150, 40),
(12, 7, 1, 500.00, 50, 25),
(13, 8, 1, 200.00, 100, 10),
(14, 9, 1, 180.00, 80, 5),
(15, 10, 1, 100.00, 500, 100), (16, 10, 3, 300.00, 100, 50),
(17, 11, 1, 90.00, 200, 10),
(18, 12, 1, 60.00, 200, 0),
(19, 13, 1, 400.00, 60, 5),
(20, 14, 1, 30.00, 300, 150),
(21, 15, 1, 100.00, 200, 10),
(22, 16, 1, 80.00, 200, 5),
(23, 17, 1, 150.00, 100, 10),
(24, 18, 1, 60.00, 10, 10), -- Esgotada
(25, 19, 1, 500.00, 50, 2),
(26, 20, 1, 200.00, 100, 1),
(27, 21, 1, 180.00, 80, 0),
(28, 22, 1, 100.00, 500, 20),
(29, 23, 1, 90.00, 200, 2),
(30, 24, 1, 400.00, 60, 1),
(31, 25, 1, 30.00, 300, 50),
(32, 26, 1, 100.00, 200, 150),
(33, 27, 1, 120.00, 100, 80),
(34, 28, 3, 300.00, 50, 40),
(35, 29, 1, 80.00, 300, 10),
(36, 30, 1, 60.00, 150, 5),
(37, 31, 1, 20.00, 400, 200);


-- 10. Tabela PEDIDO

INSERT INTO pedido (id_pedido, id_cliente, data_pedido, status) VALUES
(1, 1, '2025-10-01 10:00:00', 'pago'),
(2, 2, '2025-10-02 11:30:00', 'pago'),
(3, 3, '2025-10-03 09:15:00', 'aberto'),
(4, 4, '2025-10-04 14:00:00', 'cancelado'),
(5, 5, '2025-10-05 16:45:00', 'pago'),
(6, 6, '2024-09-01 10:00:00', 'pago'),
(7, 7, '2024-09-05 11:00:00', 'pago'),
(8, 8, '2024-09-10 12:00:00', 'pago'),
(9, 9, '2025-10-10 10:00:00', 'pago'),
(10, 10, '2025-10-11 15:00:00', 'aberto'),
(11, 11, '2025-10-12 10:00:00', 'pago'),
(12, 12, '2025-10-13 11:00:00', 'pago'),
(13, 13, '2025-10-14 12:00:00', 'pago'),
(14, 14, '2025-10-15 13:00:00', 'pago'),
(15, 15, '2025-10-16 14:00:00', 'pago'),
(16, 16, '2025-10-17 15:00:00', 'pago'),
(17, 1, '2024-08-01 10:00:00', 'pago'),
(18, 2, '2024-08-05 11:00:00', 'pago'),
(19, 19, '2025-10-19 18:00:00', 'cancelado'),
(20, 20, '2025-10-20 19:00:00', 'pago'),
(21, 21, '2025-10-21 20:00:00', 'aberto'),
(22, 22, '2025-10-22 09:00:00', 'pago'),
(23, 23, '2025-10-23 10:00:00', 'pago'),
(24, 24, '2025-10-24 11:00:00', 'pago'),
(25, 25, '2025-10-25 12:00:00', 'pago'),
(26, 26, '2025-10-26 13:00:00', 'pago'),
(27, 27, '2025-10-27 14:00:00', 'pago'),
(28, 28, '2025-10-28 15:00:00', 'pago'),
(29, 29, '2025-10-29 16:00:00', 'pago'),
(30, 30, '2025-10-30 17:00:00', 'pago');


-- 11. Tabela ITEM_PEDIDO

INSERT INTO item_pedido (id_item_pedido, id_pedido, id_sessao, id_tipo_ingresso, quantidade, preco_unitario_efetivo, valor_total) VALUES
(1, 1, 1, 1, 2, 100.00, 200.00),
(2, 2, 1, 2, 1, 50.00, 50.00),
(3, 3, 2, 1, 1, 120.00, 120.00),
(4, 4, 3, 3, 2, 200.00, 400.00),
(5, 5, 4, 1, 1, 150.00, 150.00),
(6, 6, 26, 1, 1, 100.00, 100.00),
(7, 7, 27, 1, 2, 120.00, 240.00),
(8, 8, 28, 3, 1, 300.00, 300.00),
(9, 9, 1, 3, 1, 250.00, 250.00),
(10, 10, 2, 2, 2, 60.00, 120.00),
(11, 11, 6, 1, 2, 60.00, 120.00),
(12, 12, 7, 1, 1, 500.00, 500.00),
(13, 13, 10, 1, 4, 100.00, 400.00),
(14, 14, 14, 1, 5, 30.00, 150.00),
(15, 15, 31, 1, 2, 20.00, 40.00),
(16, 16, 4, 1, 1, 150.00, 150.00),
(17, 17, 26, 1, 1, 100.00, 100.00),
(18, 18, 26, 1, 1, 100.00, 100.00),
(19, 19, 5, 1, 1, 150.00, 150.00),
(20, 20, 10, 3, 1, 300.00, 300.00),
(21, 22, 15, 1, 2, 100.00, 200.00),
(22, 23, 16, 1, 1, 80.00, 80.00),
(23, 24, 18, 1, 1, 60.00, 60.00),
(24, 25, 25, 1, 3, 30.00, 90.00),
(25, 26, 30, 1, 2, 60.00, 120.00),
(26, 27, 31, 1, 1, 20.00, 20.00),
(27, 28, 1, 2, 1, 50.00, 50.00),
(28, 29, 2, 1, 1, 120.00, 120.00),
(29, 30, 3, 1, 1, 80.00, 80.00);


-- 12. Tabela PAGAMENTO

INSERT INTO pagamento (id_pagamento, id_pedido, valor, data_pagamento, status, forma_pagamento) VALUES
(1, 1, 200.00, '2025-10-01 10:05:00', 'aprovado', 'Cartão de Crédito'),
(2, 2, 50.00, '2025-10-02 11:35:00', 'aprovado', 'PIX'),
(3, 4, 400.00, '2025-10-04 14:05:00', 'estornado', 'Cartão de Crédito'),
(4, 5, 150.00, '2025-10-05 16:50:00', 'aprovado', 'Boleto'),
(5, 6, 100.00, '2024-09-01 10:05:00', 'aprovado', 'PIX'),
(6, 7, 240.00, '2024-09-05 11:05:00', 'aprovado', 'Cartão de Crédito'),
(7, 8, 300.00, '2024-09-10 12:05:00', 'aprovado', 'PIX'),
(8, 9, 250.00, '2025-10-10 10:05:00', 'aprovado', 'Cartão de Crédito'),
(9, 11, 120.00, '2025-10-12 10:05:00', 'aprovado', 'PIX'),
(10, 12, 500.00, '2025-10-13 11:05:00', 'aprovado', 'Cartão de Crédito'),
(11, 13, 350.00, '2025-10-14 12:05:00', 'aprovado', 'Cartão de Crédito'),
(12, 14, 150.00, '2025-10-15 13:05:00', 'aprovado', 'PIX'),
(13, 15, 40.00, '2025-10-16 14:05:00', 'aprovado', 'Dinheiro'),
(14, 16, 150.00, '2025-10-17 15:05:00', 'aprovado', 'PIX'),
(15, 17, 100.00, '2024-08-01 10:05:00', 'aprovado', 'PIX'),
(16, 18, 100.00, '2024-08-05 11:05:00', 'aprovado', 'PIX'),
(17, 20, 300.00, '2025-10-20 19:05:00', 'aprovado', 'Cartão de Crédito'),
(18, 22, 200.00, '2025-10-22 09:05:00', 'aprovado', 'Boleto'),
(19, 23, 80.00, '2025-10-23 10:05:00', 'aprovado', 'PIX'),
(20, 24, 60.00, '2025-10-24 11:05:00', 'aprovado', 'PIX'),
(21, 25, 90.00, '2025-10-25 12:05:00', 'aprovado', 'Cartão de Crédito'),
(22, 26, 120.00, '2025-10-26 13:05:00', 'aprovado', 'PIX'),
(23, 27, 20.00, '2025-10-27 14:05:00', 'aprovado', 'Dinheiro'),
(24, 28, 50.00, '2025-10-28 15:05:00', 'aprovado', 'Cartão de Crédito'),
(25, 29, 120.00, '2025-10-29 16:05:00', 'aprovado', 'PIX'),
(26, 30, 80.00, '2025-10-30 17:05:00', 'aprovado', 'PIX');


-- 13. Tabela CHECK_IN (Colunas id_chekin e horario_chekin)

INSERT INTO check_in (id_chekin, id_cliente, id_sessao, horario_chekin, valido) VALUES
(1, 6, 26, '2024-10-10 19:30:00', 1),
(2, 7, 27, '2024-10-15 18:45:00', 1),
(3, 8, 28, '2024-10-20 08:50:00', 1),
(4, 1, 26, '2024-10-10 19:35:00', 1),
(5, 2, 26, '2024-10-10 19:40:00', 1),
(6, 17, 26, '2024-10-10 19:45:00', 1);