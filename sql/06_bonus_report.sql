USE cyberware_build_db;

-- 보너스 과제 3
-- 데이터베이스에서 확인할 핵심 지표 3개

-- 지표 1. 빌드별 사용 사이버웨어 용량과 남은 용량
-- 빌드가 사용할 수 있는 최대 용량과 현재 조합이 차지하는 용량 비교
SELECT
    b.build_name,
    b.max_cyberware_capacity,
    COALESCE(SUM(c.capacity), 0) AS used_cyberware_capacity,
    b.max_cyberware_capacity
        - COALESCE(SUM(c.capacity), 0) AS remaining_capacity
FROM build AS b
LEFT JOIN build_cyberware AS bc
    ON b.build_id = bc.build_id
LEFT JOIN cyberware AS c
    ON bc.cyberware_id = c.cyberware_id
GROUP BY
    b.build_id,
    b.build_name,
    b.max_cyberware_capacity
ORDER BY used_cyberware_capacity DESC;

-- 지표 2. 슬롯별 사이버웨어 종류와 평균 용량
-- 각 슬롯에 등록된 사이버웨어 종류의 수와 평균 용량 비교
SELECT
    s.slot_name,
    s.max_equip_count,
    COUNT(c.cyberware_id) AS cyberware_count,
    COALESCE(AVG(c.capacity), 0) AS average_capacity
FROM cyberware_slot AS s
LEFT JOIN cyberware AS c
    ON s.slot_id = c.slot_id
GROUP BY
    s.slot_id,
    s.slot_name,
    s.max_equip_count
ORDER BY cyberware_count DESC;

-- 지표 3. 빌드별 총 방어력 증가량
-- 각 빌드에 포함된 사이버웨어의 방어력 증가량 합계 비교
SELECT
    b.build_name,
    b.build_type,
    COALESCE(SUM(c.defense_bonus), 0) AS total_defense_bonus
FROM build AS b
LEFT JOIN build_cyberware AS bc
    ON b.build_id = bc.build_id
LEFT JOIN cyberware AS c
    ON bc.cyberware_id = c.cyberware_id
GROUP BY
    b.build_id,
    b.build_name,
    b.build_type
ORDER BY total_defense_bonus DESC;
