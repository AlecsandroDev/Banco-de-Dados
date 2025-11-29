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

-- Exercicio 9
SELECT 
    c.nome AS categoria, 
    SUM(ip.quantidade) AS ingressos_vendidos, 
    SUM(ip.valor_total) AS faturamento_total
FROM categoria c
JOIN evento e ON c.id_categoria = e.id_categoria
JOIN sessao s ON e.id_evento = s.id_evento
JOIN item_pedido ip ON s.id_sessao = ip.id_sessao
JOIN pedido p ON ip.id_pedido = p.id_pedido
WHERE p.status = 'pago'
GROUP BY c.nome
ORDER BY faturamento_total DESC;

-- Exercicio 10
SELECT 
    e.titulo AS evento, 
    s.data_hora,
    ROUND((SUM(sti.quantidade_vendida) / SUM(sti.quantidade_ofertada)) * 100, 2) AS taxa_ocupacao
FROM sessao s
JOIN evento e ON s.id_evento = e.id_evento
JOIN sessao_tipo_ingresso sti ON s.id_sessao = sti.id_sessao
GROUP BY s.id_sessao, e.titulo, s.data_hora
HAVING taxa_ocupacao >= 80.00
ORDER BY taxa_ocupacao DESC;

-- Exercicio 11
SELECT 
    c.nome AS categoria, 
    ti.nome AS tipo_ingresso, 
    SUM(sti.quantidade_vendida) AS total_vendido
FROM categoria c
JOIN evento e ON c.id_categoria = e.id_categoria
JOIN sessao s ON e.id_evento = s.id_evento
JOIN sessao_tipo_ingresso sti ON s.id_sessao = sti.id_sessao
JOIN tipo_ingresso ti ON sti.id_tipo_ingresso = ti.id_tipo_ingresso
WHERE s.status IN ('aberta', 'esgotada')
GROUP BY c.nome, ti.nome
ORDER BY c.nome, total_vendido DESC;

-- Exercicio 12
SELECT 
    l.nome AS local, 
    SUM(ip.valor_total) AS faturamento_projetado
FROM local l
JOIN evento e ON l.id_local = e.id_local_previsto
JOIN sessao s ON e.id_evento = s.id_evento
JOIN item_pedido ip ON s.id_sessao = ip.id_sessao
JOIN pedido p ON ip.id_pedido = p.id_pedido
WHERE p.status = 'pago'
  AND s.data_hora BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 3 MONTH)
GROUP BY l.nome
ORDER BY faturamento_projetado DESC;

-- Exercicio 13
SELECT 
    e.titulo,
    s.data_hora,
    SUM(sti.quantidade_vendida) AS total_vendido
FROM evento e
JOIN sessao s ON e.id_evento = s.id_evento
JOIN sessao_tipo_ingresso sti ON s.id_sessao = sti.id_sessao
GROUP BY e.id_evento, s.id_sessao
HAVING s.id_sessao = (
    SELECT s2.id_sessao
    FROM sessao s2
    JOIN sessao_tipo_ingresso sti2 ON s2.id_sessao = sti2.id_sessao
    WHERE s2.id_evento = e.id_evento
    GROUP BY s2.id_sessao
    ORDER BY SUM(sti2.quantidade_vendida) DESC, s2.data_hora DESC
    LIMIT 1
);

-- Exercicio 14
SELECT c.nome AS categoria_problematica
FROM categoria c
LEFT JOIN evento e ON c.id_categoria = e.id_categoria AND e.status = 'Ativo'
LEFT JOIN sessao s ON e.id_evento = s.id_evento
LEFT JOIN sessao_tipo_ingresso sti ON s.id_sessao = sti.id_sessao
GROUP BY c.id_categoria, c.nome
HAVING 
    COUNT(e.id_evento) = 0 
    OR 
    (SUM(sti.quantidade_vendida) IS NULL OR SUM(sti.quantidade_vendida) = 0);

-- Exercicio 15
SELECT 
    c.id_cliente, 
    c.nome
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
JOIN sessao s ON ip.id_sessao = s.id_sessao
JOIN evento e ON s.id_evento = e.id_evento
JOIN check_in ci ON c.id_cliente = ci.id_cliente AND ci.id_sessao = s.id_sessao
WHERE p.status = 'pago' 
  AND p.data_pedido >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY c.id_cliente
HAVING 
    COUNT(DISTINCT p.id_pedido) >= 3 
    AND COUNT(DISTINCT ci.id_sessao) >= 2 
    AND COUNT(DISTINCT e.id_categoria) >= 2;

-- Exercicio 16
SELECT 
    p.id_pedido, 
    p.status,
    SUM(ip.valor_total) AS total_devido_itens,
    SUM(pag.valor) AS total_pagamentos_aprovados,
    (SUM(ip.valor_total) - SUM(pag.valor)) AS diferenca
FROM pedido p
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
LEFT JOIN pagamento pag ON p.id_pedido = pag.id_pedido AND pag.status = 'aprovado'
WHERE p.status = 'pago'
GROUP BY p.id_pedido
HAVING total_devido_itens != total_pagamentos_aprovados;