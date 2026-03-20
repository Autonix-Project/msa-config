USE shipping_db;

-- ================================
-- 배송 테이블
-- ================================
CREATE TABLE shippings (
    shipping_id     INT         AUTO_INCREMENT PRIMARY KEY,
    shipping_number VARCHAR(20) NOT NULL UNIQUE COMMENT '예: SHIP-001',
    shipping_car_id VARCHAR(20) NOT NULL        COMMENT '예: CAR-001',
    order_id        INT         NOT NULL        COMMENT 'FK → order_db.orders (cross-db, 논리적 참조)',
    shipping_state  VARCHAR(20) NOT NULL        COMMENT '출고대기/배송중/배송완료',
    car_model       VARCHAR(100),
    created_at      DATETIME    NOT NULL,
    arrival_at      DATETIME                    COMMENT '배송완료일'
);
