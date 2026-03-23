-- ================================
-- 라인 초기 데이터 (line_db)
-- ================================
USE line_db;

INSERT INTO `lines` (line_number, line_name, line_type, line_status, created_at, updated_at) VALUES
('LINE-1', '차체 라인 A', '차체',    'NORMAL', NOW(), NOW()),
('LINE-2', '차체 라인 B', '차체',    'NORMAL', NOW(), NOW()),
('LINE-3', '도장 라인 A',  '도장',    'NORMAL', NOW(), NOW()),
('LINE-4', '도장 라인 B',  '도장',    'NORMAL', NOW(), NOW()),
('LINE-5', '조립 라인 A', '조립',    'NORMAL', NOW(), NOW()),
('LINE-6', '조립 라인 B', '조립',    'NORMAL', NOW(), NOW()),
('LINE-7', 'QC 라인',    '품질검사', 'NORMAL', NOW(), NOW());


-- ================================
-- 부품 초기 재고 (inventory_db)
-- ================================
USE inventory_db;

INSERT INTO parts (part_name, part_code, current_stock, min_stock, unit, created_at, updated_at) VALUES
-- 파워트레인 스테이션 부품
('엔진',           'ENG-001', 50,  10, '개',  NOW(), NOW()),
('변속기',         'TRN-001', 50,  10, '개',  NOW(), NOW()),
('드라이브샤프트', 'DRV-001', 100, 20, '개',  NOW(), NOW()),
-- 섀시 스테이션 부품
('타이어',         'TIR-001', 200, 40, '세트', NOW(), NOW()),
('브레이크세트',   'BRK-001', 100, 20, '세트', NOW(), NOW()),
('서스펜션',       'SUS-001', 100, 20, '세트', NOW(), NOW()),
-- 전장 스테이션 부품
('배터리',         'BAT-001', 50,  10, '개',  NOW(), NOW()),
('ECU',            'ECU-001', 50,  10, '개',  NOW(), NOW()),
('센서',           'SEN-001', 200, 40, '개',  NOW(), NOW()),
-- 내부조립 스테이션 부품
('시트',           'SEA-001', 100, 20, '세트', NOW(), NOW()),
('에어백',         'AIR-001', 100, 20, '개',  NOW(), NOW()),
('내부부품',       'INT-001', 100, 20, '세트', NOW(), NOW());

-- ================================
-- 라인 통계 데이터 (line_stats)
-- ================================
USE line_db;

INSERT INTO line_stats (line_id, stat_date, operation_rate, completed_count, avg_cycle_time)
SELECT line_id, CURDATE(), 92.5, 38, 46 FROM `lines` WHERE line_number = 'LINE-1'
UNION ALL
SELECT line_id, CURDATE(), 88.2, 34, 52 FROM `lines` WHERE line_number = 'LINE-2'
UNION ALL
SELECT line_id, CURDATE(), 79.4, 29, 61 FROM `lines` WHERE line_number = 'LINE-3'
UNION ALL
SELECT line_id, CURDATE(), 84.7, 31, 55 FROM `lines` WHERE line_number = 'LINE-4'
UNION ALL
SELECT line_id, CURDATE(), 90.1, 36, 48 FROM `lines` WHERE line_number = 'LINE-5'
UNION ALL
SELECT line_id, CURDATE(), 86.8, 33, 53 FROM `lines` WHERE line_number = 'LINE-6'
UNION ALL
SELECT line_id, CURDATE(), 93.3, 40, 44 FROM `lines` WHERE line_number = 'LINE-7';
