USE cyberware_build_db;

-- 보너스 과제 1
-- 같은 요구사항을 JOIN 방식과 서브쿼리 방식으로 각각 작성
-- 요구사항: 외피 시스템 슬롯에 장착되는 모든 사이버웨어의 이름, 등급, 용량 조회

-- 1-1. JOIN 방식
SELECT
    c.cyberware_name,
    c.quality,
    c.capacity
FROM cyberware AS c
JOIN cyberware_slot AS s
    ON c.slot_id = s.slot_id
WHERE s.slot_name = '외피 시스템';

-- 1-2. 서브쿼리 방식
SELECT
    cyberware_name,
    quality,
    capacity
FROM cyberware
WHERE slot_id = (
    SELECT slot_id
    FROM cyberware_slot
    WHERE slot_name = '외피 시스템'
);
