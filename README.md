# msa-config

스마트팩토리 MSA 프로젝트 공통 인프라 설정

## 실행 방법

```bash
# 전체 실행 (MySQL + Kafka + Zookeeper)
docker-compose up -d

# 로그 확인
docker-compose logs -f

# 종료
docker-compose down

# 데이터 완전 초기화 후 재시작 (seed 다시 넣을 때)
docker-compose down -v
docker-compose up -d
```

## DB 접속 정보

| DB | 포트 | 데이터베이스 |
|---|---|---|
| MySQL | 3306 | - |
| ㄴ line_db | - | lines, vehicles, process_history, line_stats, notifications |
| ㄴ order_db | - | member, orders |
| ㄴ inventory_db | - | parts, inventory_transactions, notifications |
| ㄴ shipping_db | - | shippings |

- host: `localhost:3307`
- root password: 비밀

## Kafka 접속 정보

- bootstrap-servers: `localhost:9092`

## 토픽 목록

| 토픽 | Producer | Consumer | 파티션 키 |
|---|---|---|---|
| `production.started` | order-service | simulator-service | order_id |
| `inventory.deduct` | simulator-service | inventory-service | vehicle_id |
| `line.fault` | line-service | gateway | line_id |
| `stock.low` | inventory-service | gateway | part_id |

## 각 서비스 application.yml DB 설정

```yaml
# line-service
spring.datasource.url: jdbc:mysql://localhost:3307/line_db

# order-service
spring.datasource.url: jdbc:mysql://localhost:3307/order_db

# inventory-service
spring.datasource.url: jdbc:mysql://localhost:3307/inventory_db

# shipping-service
spring.datasource.url: jdbc:mysql://localhost:3307/shipping_db
```

## 초기 데이터

- 관리자 계정 ID: `admin@factory.com` / 비번: 비밀
- 라인 6개: 차체A, 차체B, 도장, 조립A, 조립B, QC
- 부품 12종: 파워트레인(3) + 섀시(3) + 전장(3) + 내부조립(3)
