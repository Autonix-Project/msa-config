USE inventory_db;

-- ================================
-- 부품 테이블
-- ================================
CREATE TABLE parts (
    part_id       INT          AUTO_INCREMENT PRIMARY KEY,
    part_name     VARCHAR(100) NOT NULL  COMMENT '엔진블록/변속기/타이어세트 등',
    part_code     VARCHAR(50)  NOT NULL UNIQUE,
    current_stock INT          NOT NULL,
    min_stock     INT          NOT NULL  COMMENT '최소 재고 기준',
    unit          VARCHAR(20)  NOT NULL  COMMENT '개/세트 등',
    created_at    DATETIME     NOT NULL,
    updated_at    DATETIME     NOT NULL
);

-- ================================
-- 재고 이력 테이블
-- ================================
CREATE TABLE inventory_transactions (
    transaction_id   INT         AUTO_INCREMENT PRIMARY KEY,
    part_id          INT         NOT NULL COMMENT 'FK → parts',
    transaction_type VARCHAR(10) NOT NULL COMMENT 'IN/OUT',
    quantity         INT         NOT NULL,
    remaining_stock  INT         NOT NULL,
    vehicle_id       INT         NOT NULL COMMENT '차감 시 참조',
    order_number     VARCHAR(20)          COMMENT '예: ORD-001',
    created_at       DATETIME    NOT NULL,
    FOREIGN KEY (part_id) REFERENCES parts(part_id)
);

-- ================================
-- 알림 테이블 (재고 부족용)
-- ================================
CREATE TABLE notifications (
    notification_id   INT          AUTO_INCREMENT PRIMARY KEY,
    notification_type VARCHAR(20)  NOT NULL COMMENT 'LINE_FAULT/STOCK_LOW',
    source_service    VARCHAR(50)  NOT NULL COMMENT 'line/inventory',
    message           VARCHAR(255) NOT NULL,
    reference_id      INT                   COMMENT '부품ID',
    created_at        DATETIME     NOT NULL,
    is_read           BOOLEAN      NOT NULL DEFAULT FALSE
);
