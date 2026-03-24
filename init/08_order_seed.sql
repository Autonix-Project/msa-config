-- ================================
-- 주문 테스트 데이터 (order_db)
-- ================================
USE order_db;

INSERT INTO orders (order_number, destination, status, deadline, car_color, car_model, total_quantity, created_at, updated_at) VALUES
('ORD-AA0001', 'SEOUL',   'IN_PROGRESS', NOW() + INTERVAL 30 DAY, 'WHITE',  'SONATA',   3, NOW() - INTERVAL 14 HOUR, NOW()),
('ORD-BB0002', 'BUSAN',   'IN_PROGRESS', NOW() + INTERVAL 25 DAY, 'BLACK',  'GRANDEUR', 2, NOW() - INTERVAL 13 HOUR, NOW()),
('ORD-CC0003', 'DAEGU',   'IN_PROGRESS', NOW() + INTERVAL 20 DAY, 'SILVER', 'TUCSON',   4, NOW() - INTERVAL 12 HOUR, NOW()),
('ORD-DD0004', 'INCHEON', 'IN_PROGRESS', NOW() + INTERVAL 15 DAY, 'BLUE',   'PALISADE', 2, NOW() - INTERVAL 11 HOUR, NOW()),
('ORD-EE0005', 'SEOUL',   'IN_PROGRESS', NOW() + INTERVAL 10 DAY, 'RED',    'AVANTE',   3, NOW() - INTERVAL 10 HOUR, NOW());
