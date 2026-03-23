SET NAMES utf8mb4;
USE line_db;

-- 기존 테스트 데이터 삭제
DELETE FROM process_history;
DELETE FROM notifications;
DELETE FROM vehicles;

-- 차량 10대
INSERT INTO vehicles (vehicle_number, order_id, car_model, car_color, current_process, current_station, current_line_id, process_started_at, status, created_at, updated_at) VALUES
('VH-0001', 1,  '소나타 N라인',     '흰색',  '차체',     NULL,              1, NOW() - INTERVAL 2 HOUR,    'PROCESSING', NOW() - INTERVAL 3 HOUR,  NOW()),
('VH-0002', 2,  '투싼 하이브리드', '검정',  '차체',     NULL,              1, NOW() - INTERVAL 1 HOUR,    'PROCESSING', NOW() - INTERVAL 2 HOUR,  NOW()),
('VH-0003', 3,  '아이오닉6',        '파랑',  '차체',     NULL,              2, NOW() - INTERVAL 90 MINUTE, 'PROCESSING', NOW() - INTERVAL 2 HOUR,  NOW()),
('VH-0004', 4,  '팰리세이드',       '실버',  '도장',     NULL,              3, NOW() - INTERVAL 3 HOUR,    'PROCESSING', NOW() - INTERVAL 5 HOUR,  NOW()),
('VH-0005', 5,  '코나 일렉트릭',   '빨강',  '도장',     NULL,              3, NOW() - INTERVAL 2 HOUR,    'PROCESSING', NOW() - INTERVAL 4 HOUR,  NOW()),
('VH-0006', 6,  '소나타 N라인',     '회색',  '도장',     NULL,              4, NOW() - INTERVAL 1 HOUR,    'PROCESSING', NOW() - INTERVAL 3 HOUR,  NOW()),
('VH-0007', 7,  '투싼 하이브리드', '흰색',  '조립',     '파워트레인 장착', 5, NOW() - INTERVAL 4 HOUR,    'PROCESSING', NOW() - INTERVAL 6 HOUR,  NOW()),
('VH-0008', 8,  '아이오닉6',        '검정',  '조립',     '섀시/하부 조립',  5, NOW() - INTERVAL 2 HOUR,    'PROCESSING', NOW() - INTERVAL 5 HOUR,  NOW()),
('VH-0009', 9,  '팰리세이드',       '갈색',  '품질검사', NULL,              7, NOW() - INTERVAL 1 HOUR,    'PROCESSING', NOW() - INTERVAL 7 HOUR,  NOW()),
('VH-0010', 10, '코나 일렉트릭',   '실버',  '품질검사', NULL,              7, NOW() - INTERVAL 30 MINUTE, 'QC_PASS',    NOW() - INTERVAL 8 HOUR,  NOW());

-- 공정 이력 (vehicle_number로 id 조회)
INSERT INTO process_history (vehicle_id, line_id, process_type, station, started_at, completed_at, duration_minutes)
SELECT v.vehicle_id, 1, '차체', NULL, NOW() - INTERVAL 6 HOUR, NOW() - INTERVAL 5 HOUR, 60 FROM vehicles v WHERE v.vehicle_number = 'VH-0007';
INSERT INTO process_history (vehicle_id, line_id, process_type, station, started_at, completed_at, duration_minutes)
SELECT v.vehicle_id, 3, '도장', NULL, NOW() - INTERVAL 5 HOUR, NOW() - INTERVAL 4 HOUR, 60 FROM vehicles v WHERE v.vehicle_number = 'VH-0007';
INSERT INTO process_history (vehicle_id, line_id, process_type, station, started_at, completed_at, duration_minutes)
SELECT v.vehicle_id, 5, '조립', '파워트레인 장착', NOW() - INTERVAL 4 HOUR, NULL, NULL FROM vehicles v WHERE v.vehicle_number = 'VH-0007';
INSERT INTO process_history (vehicle_id, line_id, process_type, station, started_at, completed_at, duration_minutes)
SELECT v.vehicle_id, 2, '차체', NULL, NOW() - INTERVAL 5 HOUR, NOW() - INTERVAL 4 HOUR, 60 FROM vehicles v WHERE v.vehicle_number = 'VH-0008';
INSERT INTO process_history (vehicle_id, line_id, process_type, station, started_at, completed_at, duration_minutes)
SELECT v.vehicle_id, 4, '도장', NULL, NOW() - INTERVAL 4 HOUR, NOW() - INTERVAL 3 HOUR, 60 FROM vehicles v WHERE v.vehicle_number = 'VH-0008';
INSERT INTO process_history (vehicle_id, line_id, process_type, station, started_at, completed_at, duration_minutes)
SELECT v.vehicle_id, 5, '조립', '섀시/하부 조립', NOW() - INTERVAL 2 HOUR, NULL, NULL FROM vehicles v WHERE v.vehicle_number = 'VH-0008';

-- 알림
INSERT INTO notifications (notification_type, source_service, message, reference_id, created_at, is_read) VALUES
('LINE_FAULT', 'line-service', '[라인 장애] 차체 라인 A 장애 발생',    1, NOW() - INTERVAL 30 MINUTE, FALSE),
('LINE_FAULT', 'line-service', '[라인 장애] 도장 라인 B 장애 발생',    4, NOW() - INTERVAL 20 MINUTE, FALSE),
('STOCK_LOW',  'inventory',    '[재고 부족] 엔진 재고 부족 (현재 5개)', 1, NOW() - INTERVAL 10 MINUTE, FALSE);
