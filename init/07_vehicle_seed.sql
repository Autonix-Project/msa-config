-- ================================
-- 차량 테스트 데이터 (line_db)
-- ================================
USE line_db;

INSERT INTO vehicles (vehicle_number, order_id, car_model, car_color, current_process, current_station, current_line_id, process_started_at, status, created_at, updated_at) VALUES
('VH-0001', 1, '소나타',      '화이트', '차체',    NULL,           1, NOW() - INTERVAL 3  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0002', 1, '소나타',      '블랙',   '차체',    NULL,           2, NOW() - INTERVAL 2  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0003', 1, '그랜저',      '실버',   '도장',    NULL,           3, NOW() - INTERVAL 5  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0004', 2, '그랜저',      '블루',   '도장',    NULL,           4, NOW() - INTERVAL 4  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0005', 2, '아반떼',      '레드',   '조립',    '파워트레인 장착',  5, NOW() - INTERVAL 6  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0006', 2, '아반떼',      '화이트', '조립',    '섀시하부 조립',    5, NOW() - INTERVAL 7  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0007', 3, '투싼',        '그레이', '조립',    '전장 시스템',      6, NOW() - INTERVAL 8  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0008', 3, '투싼',        '블랙',   '조립',    '내부 조립',        6, NOW() - INTERVAL 9  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0009', 3, '팰리세이드',  '화이트', '품질검사', NULL,           7, NOW() - INTERVAL 10 HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0010', 4, '팰리세이드',  '블루',   '품질검사', NULL,           7, NOW() - INTERVAL 11 HOUR, 'QC_PASS',    NOW(), NOW()),
('VH-0011', 4, '소나타',      '실버',   '출고',    NULL,        NULL, NOW() - INTERVAL 12 HOUR, 'COMPLETED',  NOW(), NOW()),
('VH-0012', 4, '그랜저',      '블랙',   '출고',    NULL,        NULL, NOW() - INTERVAL 13 HOUR, 'COMPLETED',  NOW(), NOW()),
('VH-0013', 5, '아반떼',      '그레이', '차체',    NULL,           1, NOW() - INTERVAL 1  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0014', 5, '투싼',        '화이트', '도장',    NULL,           3, NOW() - INTERVAL 3  HOUR, 'PROCESSING', NOW(), NOW()),
('VH-0015', 5, '팰리세이드',  '레드',   '조립',    '파워트레인 장착',  5, NOW() - INTERVAL 5  HOUR, 'PROCESSING', NOW(), NOW());
