USE order_db;

-- ================================
-- 회원 테이블
-- ================================
CREATE TABLE member (
    member_id INT          AUTO_INCREMENT PRIMARY KEY,
    email     VARCHAR(255) NOT NULL UNIQUE,
    password  VARCHAR(255) NOT NULL
);

-- ================================
-- 주문 테이블
-- ================================
CREATE TABLE orders (
    order_id       INT          AUTO_INCREMENT PRIMARY KEY,
    member_id      INT          NOT NULL         COMMENT 'FK → member',
    order_number   VARCHAR(20)  NOT NULL UNIQUE  COMMENT '예: ORD-ABC123',
    destination    VARCHAR(20)  NOT NULL,
    status         VARCHAR(50)  NOT NULL DEFAULT 'READY' COMMENT 'READY/IN_PROGRESS/COMPLETED',
    deadline       DATETIME,
    car_color      VARCHAR(50)           COMMENT 'vehicles.car_color 참조',
    car_model      VARCHAR(100)          COMMENT 'vehicles.car_model 참조',
    total_quantity INT          NOT NULL,
    created_at     DATETIME     NOT NULL,
    updated_at     DATETIME     NOT NULL,
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);
