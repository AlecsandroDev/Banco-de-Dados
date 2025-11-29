USE plataforma;

-- Exercicio 1
SELECT 
    c.nome AS categoria, 
    e.titulo AS evento
FROM evento e
JOIN categoria c ON e.id_categoria = c.id_categoria
WHERE e.status = 'Ativo'
ORDER BY c.nome, e.titulo;

-- Exercicio 2
SELECT 
    s.id_sessao, 
    e.titulo AS evento, 
    s.data_hora
FROM sessao s
JOIN evento e ON s.id_evento = e.id_evento
WHERE s.status = 'aberta' 
  AND s.data_hora BETWEEN '2025-11-01' AND '2025-12-31';

-- Exercicio 3
SELECT 
    id_artista, 
    nome_artista
FROM artista
WHERE nome_artista LIKE '%el%'
ORDER BY nome_artista;

-- Exercicio 4
SELECT 
    e.titulo AS evento, 
    l.nome AS local, 
    c.nome AS categoria
FROM evento e
JOIN local l ON e.id_local_previsto = l.id_local
JOIN categoria c ON e.id_categoria = c.id_categoria
WHERE l.nome LIKE '%Teatro Municipal%';

-- Exercicio 5
SELECT 
    s.id_sessao, 
    e.titulo AS evento, 
    c.nome AS categoria, 
    l.nome AS local, 
    s.data_hora
FROM sessao s
JOIN evento e ON s.id_evento = e.id_evento
JOIN categoria c ON e.id_categoria = c.id_categoria
JOIN local l ON e.id_local_previsto = l.id_local
ORDER BY s.data_hora DESC;

-- Exercicio 6
SELECT 
    status, 
    COUNT(*) AS total_pedidos
FROM pedido
WHERE data_pedido >= DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY status
ORDER BY total_pedidos DESC;

-- Exercicio 7
SELECT 
    c.nome AS categoria, 
    COUNT(e.id_evento) AS qtd_eventos
FROM categoria c
JOIN evento e ON c.id_categoria = e.id_categoria
WHERE e.status = 'Ativo'
GROUP BY c.nome
ORDER BY qtd_eventos DESC
LIMIT 5;

-- Exercicio 8
SELECT DISTINCT 
    c.id_cliente, 
    c.nome
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE MONTH(p.data_pedido) = MONTH(NOW()) 
  AND YEAR(p.data_pedido) = YEAR(NOW());