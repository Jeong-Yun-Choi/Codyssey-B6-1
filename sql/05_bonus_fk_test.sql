USE cyberware_build_db;

-- 보너스 과제 2
-- 존재하지 않는 외래키 값을 입력하여 FK 오류를 발생시키고 원인과 해결 방법 기록

-- 2-1. 존재하지 않는 슬롯 ID인지 확인
SELECT *
FROM cyberware_slot
WHERE slot_id = 9999;

-- 2-2. 존재하지 않는 slot_id를 입력하여 의도적으로 FK 오류 발생
-- cyberware.slot_id는 cyberware_slot.slot_id를 참조하므로
-- 부모 테이블에 slot_id가 9999인 행이 없으면 INSERT가 거부됨
INSERT INTO cyberware
    (cyberware_name, quality, capacity, defense_bonus, slot_id)
VALUES
    ('FK 오류 테스트용 사이버웨어', 1, 0, 0, 9999);

-- 2-3. 올바른 슬롯 이름을 이용한 수정된 INSERT문
-- 위 INSERT가 실패했으므로 이 구문으로 정상적인 외래키 값을 입력
INSERT INTO cyberware
    (cyberware_name, quality, capacity, defense_bonus, slot_id)
VALUES
    (
        'FK 오류 테스트용 사이버웨어',
        1,
        0,
        0,
        (SELECT slot_id
         FROM cyberware_slot
         WHERE slot_name = '얼굴')
    );
