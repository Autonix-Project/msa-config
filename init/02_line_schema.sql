USE line_db;

-- ================================
-- 라인 테이블
-- ================================
CREATE TABLE lines (
    line_id     INT          AUTO_INCREMENT PRIMARY KEY,
    line_number VARCHAR(20)  NOT NULL UNIQUE  COMMENT '예: LINE-1',
    line_name   VARCHAR(100) NOT NULL         COMMENT '예: 조립 라인 A',
    line_type   VARCHAR(20)  NOT NULL         COMMENT '차체/도장/조립/품질검사/출고',
    line_status VARCHAR(20)  NOT NULL DEFAULT 'NORMAL' COMMENT 'NORMAL/FAULT/STOPPED',
    created_at  DATETIME,
    updated_at  DATETIME
);

-- ================================
-- 차량 테이블
-- ================================
CREATE TABLE vehicles (
    vehicle_id         INT          AUTO_INCREMENT PRIMARY KEY,
    vehicle_number     VARCHAR(20)  NOT NULL UNIQUE  COMMENT '예: VH-0001',
    order_id           INT          NOT NULL         COMMENT 'FK → order_db.orders',
    car_model          VARCHAR(100) NOT NULL,
    car_color          VARCHAR(50)  NOT NULL,
    current_process    VARCHAR(20)  NOT NULL         COMMENT '차체/도장/조립/품질검사/출고',
    current_station    VARCHAR(50)                   COMMENT '조립 공정만: 파워트레인/섀시/전장/내부조립',
    current_line_id    INT                           COMMENT 'FK → lines',
    process_started_at DATETIME,
    status             VARCHAR(20)  DEFAULT 'PENDING' COMMENT 'PENDING/PROCESSING/QC_PASS/QC_FAIL/COMPLETED',
    created_at         DATETIME     NOT NULL,
    updated_at         DATETIME     NOT NULL,
    FOREIGN KEY (current_line_id) REFERENCES lines(line_id)
);

-- ================================
-- 공정 이력 테이블
-- ================================
CREATE TABLE process_history (
    history_id       INT         AUTO_INCREMENT PRIMARY KEY,
    vehicle_id       INT         NOT NULL COMMENT 'FK → vehicles',
    line_id          INT         NOT NULL COMMENT 'FK → lines',
    process_type     VARCHAR(20) NOT NULL COMMENT '차체/도장/조립/품질검사/출고',
    station          VARCHAR(50)          COMMENT '조립 공정만: 파워트레인/섀시/전장/내부조립',
    started_at       DATETIME    NOT NULL,
    completed_at     DATETIME,
    duration_minutes INT,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (line_id)    REFERENCES lines(line_id)
);

-- ================================
-- 라인 통계 테이블
-- ================================
CREATE TABLE line_stats (
    stat_id         INT          AUTO_INCREMENT PRIMARY KEY,
    line_id         INT          NOT NULL COMMENT 'FK → lines',
    stat_date       DATE         NOT NULL,
    operation_rate  DECIMAL(5,2)          COMMENT '가동률(%)',
    completed_count INT                   COMMENT '완료 차량 수',
    avg_cycle_time  INT                   COMMENT '평균 사이클타임(분)',
    FOREIGN KEY (line_id) REFERENCES lines(line_id)
);

-- ================================
-- 알림 테이블 (라인 장애용)
-- ================================
CREATE TABLE notifications (
    notification_id   INT          AUTO_INCREMENT PRIMARY KEY,
    notification_type VARCHAR(20)  NOT NULL COMMENT 'LINE_FAULT/STOCK_LOW',
    source_service    VARCHAR(50)  NOT NULL COMMENT 'line/inventory',
    message           VARCHAR(255) NOT NULL,
    reference_id      INT                   COMMENT '라인ID 또는 부품ID',
    created_at        DATETIME     NOT NULL,
    is_read           BOOLEAN      NOT NULL DEFAULT FALSE
);
